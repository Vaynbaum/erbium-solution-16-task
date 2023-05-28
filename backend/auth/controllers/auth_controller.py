import asyncio
from datetime import datetime, timedelta
from fastapi import BackgroundTasks
from jose import jwt
import requests
from sqlalchemy.orm import Session
from passlib.context import CryptContext
import secrets

from common.consts import (
    NAME_INTERN_STATUS,
    NAME_ROLE_INTERN,
    PAYLOAD_NAME_EXPIRES,
    PAYLOAD_NAME_ISSUEDAT,
    ACCESS_TOKEN,
    PAYLOAD_NAME_SUB_ID,
    PAYLOAD_NAME_SUB_ROLE_ID,
    REFRESH_TOKEN,
    PAYLOAD_NAME_SCOPE,
    TOKEN_TYPE_BEARER,
)

from common.phrases import (
    ACCOUNT_EXISTS,
    CODE_INVALID,
    CODE_SEND_FAILED,
    FAILED_SIGNUP,
    INVALID_EMAIL,
    INVALID_PASSWORD,
    INVALID_TOKEN,
    INVALID_USERNAME,
    PASSWORD_SUCCESS_RESET,
    RECOVERY_DELETE_FAILED,
    RESET_PASSWORD_FAILDE,
    SCOPE_TOKEN_INVALID,
    TOKEN_EXPIRED,
    URL_SEND_SUCCESS,
)
from config import settings
from controllers.mailer_controller import MailerController
from database.db_controller import DatabaseController
from database.models.citizenship import Citizenship
from database.models.city import City
from database.models.course import Course
from database.models.curator import Curator
from database.models.direction import Direction
from database.models.hr import HR
from database.models.intern import Intern
from database.models.mentor import Mentor
from database.models.recovery import Recovery
from database.models.region import Region
from database.models.university import University
from database.models.user import User
from exceptions.db_exception import DBException
from exceptions.recover_exception import RecoverException
from exceptions.reset_exception import ResetException
from exceptions.signin_exception import SigninException
from exceptions.signup_exception import SignupException
from exceptions.token_exception import TokenException
from models.message import MessageModel
from models.token import Tokens
from models.user import SigninModel, SignupHiddenModel, SignupModel


class AuthController:
    def __init__(self):
        self.__pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
        self.__database_controller = DatabaseController()

    def signin(self, session: Session, user_details: SigninModel) -> Tokens:
        user = self.__database_controller.get_user_by_email(
            session, user_details.username
        )
        if user is None:
            raise SigninException(INVALID_USERNAME)
        if not self.__verify_password(user_details.password, user.password):
            raise SigninException(INVALID_PASSWORD)
        return self.__generate_tokens(user.id, user.role_id)

    def __add_city(self, session: Session, user_details: SignupModel):
        if type(user_details.city) is int:
            return user_details.city
        else:
            if type(user_details.region) is int:
                city = City(name=user_details.city, region_id=user_details.region)
            else:
                region = self.__database_controller.put_region(
                    session, Region(name=user_details.region)
                )
                city = City(name=user_details.city, region=region)
            return self.__database_controller.put_city(session, city).id

    def __add_citizenship(self, session: Session, user_details: SignupModel):
        if type(user_details.citizenship) is int:
            return user_details.citizenship
        else:
            return self.__database_controller.put_citizenship(
                session, Citizenship(name=user_details.citizenship)
            ).id

    def __add_course(self, session: Session, user_details: SignupModel):
        if type(user_details.course) is int:
            return user_details.course
        else:
            return self.__database_controller.put_course(
                session, Course(name=user_details.course)
            ).id

    def __add_direction(self, session: Session, user_details: SignupModel):
        if type(user_details.direction) is int:
            return user_details.direction
        else:
            return self.__database_controller.put_direction(
                session, Direction(name=user_details.direction)
            ).id

    def __add_university(self, session: Session, user_details: SignupModel):
        if type(user_details.university) is int:
            return user_details.university
        else:
            return self.__database_controller.put_university(
                session, University(name=user_details.university)
            ).id

    def signup_inter(self, session: Session, user_details: SignupModel):
        if self.__database_controller.get_user_by_email(session, user_details.email):
            raise SignupException(ACCOUNT_EXISTS)
        try:
            role = self.__database_controller.get_role_by_name(
                session, NAME_ROLE_INTERN
            )
            internship_status = (
                self.__database_controller.get_internship_status_by_name(
                    session, NAME_INTERN_STATUS
                )
            )
            nickname = requests.post(
                "https://generatom.com/ajax",
                {
                    "type": "generatom",
                    "foreign_words": "en",
                    "keys": "slesh",
                    "register_name": "lc",
                    "word": user_details.email.split("@")[0],
                },
            )
            user = User(
                email=user_details.email,
                phone=user_details.phone,
                password=self.__get_password_hash(user_details.password),
                firstname=user_details.firstname,
                lastname=user_details.lastname,
                patronymic=user_details.patronymic,
                birthdate=user_details.birthdate,
                city_id=self.__add_city(session, user_details),
                nickname=nickname.text,
                citizenship_id=self.__add_citizenship(session, user_details),
                role=role,
            )
            user_to_db = Intern(
                user=user,
                university_id=self.__add_university(session, user_details),
                course_id=self.__add_course(session, user_details),
                direction_id=self.__add_direction(session, user_details),
                internship_status=internship_status,
            )
            res = self.__database_controller.put_inter_user(session, user_to_db)
        except DBException:
            raise SignupException(FAILED_SIGNUP)
        return self.__generate_tokens(res.id, role.id)

    def refresh_token(self, refresh_token: str):
        id, role_id = self.__decode_token(refresh_token, REFRESH_TOKEN)
        return self.__generate_tokens(id, role_id)

    def reset_password(self, session: Session, code: str, password: str):
        recover_data = self.__database_controller.get_recover_data(session, code)
        if recover_data:
            user = recover_data.user
            user.password = self.__get_password_hash(password)
            try:
                self.__database_controller.update_user(session, user)
                self.__database_controller.delete_recover_data(session, user_id=user.id)
                return MessageModel(message=PASSWORD_SUCCESS_RESET)
            except DBException:
                raise ResetException(RESET_PASSWORD_FAILDE)
        raise ResetException(CODE_INVALID)

    def recover_password(self, session: Session, email: str):
        user = self.__database_controller.get_user_by_email(session, email)
        if user is None:
            raise RecoverException(INVALID_EMAIL)
        code = secrets.token_urlsafe()
        if self.__database_controller.put_recover_code(
            session, Recovery(code=code, user_id=user.id, created=datetime.today())
        ):
            return (
                MessageModel(message=URL_SEND_SUCCESS),
                code,
            )
        else:
            raise RecoverException(CODE_SEND_FAILED)

    async def delete_expire_recovery(self, session: Session, code: str):
        delay = 60 * 15
        await asyncio.sleep(delay)
        try:
            self.__database_controller.delete_recover_data(session, code=code)
        except:
            print(RECOVERY_DELETE_FAILED)

    def signup_to_not_intern(
        self,
        session: Session,
        user_details: SignupHiddenModel,
        background_tasks: BackgroundTasks,
        mailer_controller: MailerController,
    ):
        inv_data = self.__database_controller.get_inv_data(session, user_details.code)
        if inv_data:
            if self.__database_controller.get_user_by_email(
                session, user_details.email
            ):
                raise SignupException(ACCOUNT_EXISTS)
            nickname = requests.post(
                "https://generatom.com/ajax",
                {
                    "type": "generatom",
                    "foreign_words": "en",
                    "keys": "slesh",
                    "register_name": "lc",
                    "word": user_details.email.split("@")[0],
                },
            )
            password = self.__get_password_hash(user_details.password)
            role_id = inv_data.role_id
            user = User(
                email=user_details.email,
                phone=user_details.phone,
                password=password,
                firstname=user_details.firstname,
                lastname=user_details.lastname,
                patronymic=user_details.patronymic,
                birthdate=user_details.birthdate,
                city_id=user_details.city_id,
                nickname=nickname.text,
                citizenship_id=user_details.citizenship_id,
                role_id=role_id,
            )
            try:
                if role_id == 1:
                    user_to_db = Mentor(
                        user=user,
                        organization_id=user_details.organization_id,
                    )
                elif role_id == 3:
                    user_to_db = HR(
                        user=user,
                        organization_id=user_details.organization_id,
                    )
                else:
                    user_to_db = Curator(
                        user=user,
                        training_direction_id=user_details.training_direction_id,
                    )
                res = self.__database_controller.put_user(session, user_to_db)
            except DBException:
                raise SignupException(FAILED_SIGNUP)
            background_tasks.add_task(
                mailer_controller.send_greeting,
                user_details.email,
                user_details.firstname,
            )
            return self.__generate_tokens(res.id, role_id)
        raise ResetException(CODE_INVALID)

    def __decode_token(self, token: str, scope: str) -> str:
        try:
            payload = jwt.decode(
                token, settings.SECRET_STRING, algorithms=[settings.ALGORITHM]
            )
            if payload[PAYLOAD_NAME_SCOPE] == scope:
                return payload[PAYLOAD_NAME_SUB_ID], payload[PAYLOAD_NAME_SUB_ROLE_ID]
            raise TokenException(SCOPE_TOKEN_INVALID)
        except jwt.ExpiredSignatureError:
            raise TokenException(TOKEN_EXPIRED)
        except jwt.InvalidTokenError:
            raise TokenException(INVALID_TOKEN)

    def __generate_tokens(self, id: int, role_id: int):
        access_token = self.__generate_token(
            {
                PAYLOAD_NAME_EXPIRES: datetime.utcnow()
                + timedelta(days=0, minutes=settings.ACCESS_TOKEN_EXPIRE_MINUTES),
                PAYLOAD_NAME_ISSUEDAT: datetime.utcnow(),
                PAYLOAD_NAME_SCOPE: ACCESS_TOKEN,
                PAYLOAD_NAME_SUB_ID: id,
                PAYLOAD_NAME_SUB_ROLE_ID: role_id,
            }
        )
        refresh_token = self.__generate_token(
            {
                PAYLOAD_NAME_EXPIRES: datetime.utcnow()
                + timedelta(days=settings.REFRESH_TOKEN_EXPIRE_DAYS),
                PAYLOAD_NAME_ISSUEDAT: datetime.utcnow(),
                PAYLOAD_NAME_SCOPE: REFRESH_TOKEN,
                PAYLOAD_NAME_SUB_ID: id,
                PAYLOAD_NAME_SUB_ROLE_ID: role_id,
            }
        )
        return Tokens(
            access_token=access_token,
            token_type=TOKEN_TYPE_BEARER,
            refresh_token=refresh_token,
        )

    def __verify_password(self, plain_password, hashed_password):
        return self.__pwd_context.verify(plain_password, hashed_password)

    def __get_password_hash(self, password):
        return self.__pwd_context.hash(password)

    def __generate_token(self, payload):
        return jwt.encode(payload, settings.SECRET_STRING, algorithm=settings.ALGORITHM)
