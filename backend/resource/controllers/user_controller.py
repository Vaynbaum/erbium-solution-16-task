from datetime import date
import datetime
import difflib
from fastapi import BackgroundTasks
from sqlalchemy.orm import Session
import requests
import secrets

from common.phrases import (
    DATE_FAILED,
    FILE_UPDATE,
    FILE_UPDATE_FAILED,
    INVALID_EMAIL,
    ONBOARD_UPDATE,
    ONBOARD_UPDATE_FAILED,
    RESPONSE_FAILED,
    RESPONSE_POST,
    SCHOOL_UPDATE,
    SCHOOL_UPDATE_FAILED,
    SELCTION_AREADY,
    SELECTION_DELETE,
    SELECTION_DELETE_FAILED,
    SKILL_ADD,
    SKILL_ADD_FAILED,
    SKILL_ALREADY,
    SKILL_DELETE,
    SKILL_DELETE_FAILED,
    USER_UPDATE,
    USER_UPDATE_FAILED,
    VACANCY_NOT,
)
from config import settings
from controllers.auth_controller import AuthController


from database.db_controller import DatabaseController
from database.models.basic_test import BasicTest
from database.models.intern import Intern
from database.models.invation import Invation
from database.models.presence import Presence
from database.models.scholl import Scholl
from database.models.selection import Selection
from database.models.response import Response
from database.models.selection_basic_test import SelectionBasicTest
from database.models.skill import Skill
from database.models.skill_intern import SkillIntern
from database.models.task import Task
from database.models.user import User
from database.models.vacancy import Vacancy
from exceptions.token_exception import TokenException

from models.intern import UpdateInternModel
from models.message import MessageModel
from models.presence import CreatePresence
from models.school import UpdateScholl
from models.task import CreateTask
from models.user import UpdateUserModel
from common.phrases import (
    PROFILE_DELTED,
    PROFILE_DELTED_FAILED,
    USER_GET_FAILED,
    BASIC_TEST_UPDATE,
    BASIC_TEST_UPDATE_FAILED,
    RESPONSE_CHANGE_STATUS,
    RESPONSE_CHANGE_STATUS_FAILED,
    RESPONSE_NOT,
)
from models.base_test import UpdateTest
from models.vacancy import CreateVacancy


class UserController:
    def __init__(self):
        self.__database_controller = DatabaseController()
        self.__auth_controller = AuthController()

    def get_my_profile(self, session: Session, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            return self.__database_controller.get_my_profile(session, id)
        except:
            return MessageModel(message=USER_GET_FAILED)

    def delete_my_skill(self, session: Session, skill_id: int, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            self.__database_controller.delete_my_skill(session, id, skill_id)
            return MessageModel(message=SKILL_DELETE)
        except:
            return MessageModel(message=SKILL_DELETE_FAILED)

    def get_add_skill(
        self, session: Session, skill_id: int | None, skill_name: str | None, token: str
    ):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            if skill_name:
                skill_id = self.__database_controller.add_skill(
                    session, Skill(name=skill_name)
                ).id
            if self.__database_controller.get_add_skill(
                session, SkillIntern(skill_id=skill_id, intern_id=id), id
            ):
                return MessageModel(message=SKILL_ADD)
            return MessageModel(message=SKILL_ALREADY)
        except Exception as e:
            return MessageModel(message=SKILL_ADD_FAILED)

    def __change_user_field(self, user: User, user_up: UpdateUserModel):
        if user.email != user_up.email:
            nickname = requests.post(
                "https://generatom.com/ajax",
                {
                    "type": "generatom",
                    "foreign_words": "en",
                    "keys": "slesh",
                    "register_name": "lc",
                    "word": user_up.email.split("@")[0],
                },
            )
            user.nickname = nickname.text
        user.firstname = user_up.firstname
        user.lastname = user_up.lastname
        user.patronymic = user_up.patronymic
        user.birthdate = user_up.birthdate
        user.phone = user_up.phone
        user.email = user_up.email
        user.gender = user_up.gender
        user.city_id = user_up.city_id
        user.citizenship_id = user_up.citizenship_id

        return user

    def __change_intern_field(self, user: Intern, user_up: UpdateInternModel):
        user.course_id = user_up.course_id
        user.organization_id = user_up.organization_id
        user.direction_id = user_up.direction_id
        user.university_id = user_up.university_id
        user.training_direction_id = user_up.training_direction_id
        user.about_me = user_up.about_me
        user.branch_id = user_up.branch_id
        user.github = user_up.github
        user.vk = user_up.vk
        user.portfolio = user_up.portfolio
        user.organizations = user_up.organizations
        user.work_experience_id = user_up.work_experience_id
        return user

    def put_update_user(self, session: Session, user_up: UpdateUserModel, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            user = self.__database_controller.get_user_by_id(session, id)
            message = USER_UPDATE
            if (
                user.email != user_up.email
                and self.__database_controller.get_user_by_email(session, user_up.email)
            ):
                user_up.email = user.email
                message = INVALID_EMAIL
            user = self.__change_user_field(user, user_up)
            if self.__database_controller.update_user(session, user):
                return MessageModel(message=message)
            return MessageModel(message=SKILL_ALREADY)
        except Exception as e:
            return MessageModel(message=USER_UPDATE_FAILED)

    def put_update_intern(
        self, session: Session, user_up: UpdateInternModel, token: str
    ):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            user = self.__database_controller.get_intern_by_id(session, id)
            user = self.__change_intern_field(user, user_up)
            if self.__database_controller.update_intern(session, user):
                return MessageModel(message=USER_UPDATE)
            return MessageModel(message=SKILL_ALREADY)
        except Exception as e:
            return MessageModel(message=USER_UPDATE_FAILED)

    def verified_user(self, session: Session, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            user = self.__database_controller.get_user_by_id(session, id)
            user.is_verified = True
            if self.__database_controller.update_user(session, user):
                return MessageModel(message=USER_UPDATE)
        except Exception as e:
            return MessageModel(message=USER_UPDATE_FAILED)

    def change_img(self, session: Session, token: str, img: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            user = self.__database_controller.get_user_by_id(session, id)
            user.img = img
            if self.__database_controller.update_user(session, user):
                return MessageModel(message=USER_UPDATE)
        except Exception as e:
            return MessageModel(message=USER_UPDATE_FAILED)

    def change_portfolio(self, session: Session, token: str, portfolio: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            intern = self.__database_controller.get_intern_by_id(session, id)
            intern.url_portfolio = portfolio
            self.__database_controller.update_intern(session, intern)
            session.commit()
            return MessageModel(message=FILE_UPDATE)
        except Exception as e:
            return MessageModel(message=FILE_UPDATE_FAILED)

    def get_rating_intern(self, session: Session, token: str, to_mentor: bool):
        id, role_id = self.__auth_controller.decode_token(token)
        if to_mentor:
            return self.__database_controller.get_rating_mentor(session, id)
        else:
            return self.__database_controller.get_rating_intern(session, id)

    def change_base_test(self, session: Session, token: str, test_up: UpdateTest):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            test = self.__database_controller.get_test_by_id(session, test_up.id, id)
            test.passed = test_up.passed
            test.value = test_up.value
            test.basic_test_status_id = test_up.status_id
            session.commit()
            # if self.__database_controller.update_basic_test(session, test):
            return MessageModel(message=BASIC_TEST_UPDATE)
        except Exception as e:
            return MessageModel(message=BASIC_TEST_UPDATE_FAILED)

    def delete_profile(self, session: Session, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            if self.__database_controller.delete_pfofile(session, id):
                return MessageModel(message=PROFILE_DELTED)
        except Exception as e:
            return MessageModel(message=PROFILE_DELTED_FAILED)

    def status_to_check_criteria(self, intern: Intern, vacancy: Vacancy):
        today = date.today()
        delta = today.year - intern.user.birthdate.year
        if (
            intern.user.citizenship_id != 1
            or intern.course_id < 3
            or delta < 18
            or delta > 35
        ):
            return 3, False
        if intern.work_experience:
            if (
                intern.training_direction_id
                == vacancy.organization.training_direction_id
                and intern.work_experience_id >= vacancy.work_experience_id
            ):
                return 2, True
            if intern.branch:
                res_name = difflib.SequenceMatcher(
                    None, intern.branch.name, vacancy.organization.branch.name
                ).ratio()
                if (
                    res_name > 0.4
                    and intern.work_experience_id >= vacancy.work_experience_id
                ):
                    return 2, True
        return 1, None

    def add_test(self, session: Session, id: int):
        tests = self.__database_controller.get_basic_tests_by_id(session, id)
        if len(tests) > 0:
            return tests
        today = datetime.datetime.today()
        end = today + datetime.timedelta(weeks=15)
        tests = [
            BasicTest(
                type_basic_test_id=1,
                intern_id=id,
                basic_test_status_id=1,
                begin=today,
                end=end,
            ),
            BasicTest(
                type_basic_test_id=2,
                intern_id=id,
                basic_test_status_id=1,
                begin=today,
                end=end,
            ),
            BasicTest(
                type_basic_test_id=3,
                intern_id=id,
                basic_test_status_id=1,
                begin=today,
                end=end,
            ),
        ]
        return self.__database_controller.add_tests(session, tests)

    def delete_my_selection(self, session: Session, selection_id: int, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            self.__database_controller.delete_my_selection(session, id, selection_id)
            return MessageModel(message=SELECTION_DELETE)
        except:
            return MessageModel(message=SELECTION_DELETE_FAILED)

    def get_my_base_tests(self, session: Session, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        return self.__database_controller.get_my_base_tests(session, id)

    def get_my_responses(self, session: Session, token: str, to_curator: bool()):
        id, role_id = self.__auth_controller.decode_token(token)
        return self.__database_controller.get_my_responses(session, id, to_curator)

    def get_status_responses(self, session: Session):
        return self.__database_controller.get_status_responses(session)

    def other_responses_accept(self, session: Session, response_id: int, id: int):
        responses = self.__database_controller.get_other_responses(
            session, response_id, id
        )
        for response in responses:
            response.response_status_id = 3
            response.passed = True
        if len(responses) > 0:
            session.commit()

    def send_mail(self, email: str, message: str):
        try:
            result = requests.get(
                f"{settings.URL_MAILER}/any_message",
                params={"email": email, "message": message},
            )
            print(result)
            if result.status_code != 200:
                print("письмо не отправлен")
            else:
                print(result.text)
            return result
        except Exception as e:
            print(e)

    def get_change_response(
        self,
        session: Session,
        response_id: int,
        status_id: int,
        token: str,
        background_tasks: BackgroundTasks,
    ):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            response = self.__database_controller.get_response_by_id(
                session, response_id
            )
            if response:
                vacncy_name = response.selection.vacancy.name
                msg = f"Заявка на вакансию {vacncy_name} отклонена"
                if status_id == 2:
                    msg = f"Заявка на вакансию {vacncy_name} подтверждена. Вам открыт доступ к модулям 'Базовое тестирование' и 'Карьерная школа'"
                    selection = response.selection
                    if response.response_status_id != status_id:
                        tests = self.add_test(session, selection.intern_id)
                        school = self.add_school(session, selection.intern_id)
                        selection.school = school
                        selection.stage_id = 2
                        for t in tests:
                            st = SelectionBasicTest(basic_test=t)
                            selection.basic_tests.append(st)
                response.passed = True
                response.response_status_id = status_id
                background_tasks.add_task(
                    self.send_mail, selection.intern.user.email, msg
                )

                if self.__database_controller.put_response(session, response):
                    if status_id == 2:
                        self.other_responses_accept(
                            session, response_id, response.selection.intern_id
                        )
                    return MessageModel(message=RESPONSE_CHANGE_STATUS)
            return MessageModel(message=RESPONSE_NOT)
        except Exception as e:
            return MessageModel(message=RESPONSE_CHANGE_STATUS_FAILED)

    def add_school(self, session: Session, id: int):
        school = self.__database_controller.get_school_by_id(session, id)
        if school:
            return school
        school = Scholl(intern_id=id, passed=False)
        return self.__database_controller.add_school(session, school)

    def put_response(self, session: Session, token: str, vacancy_id: int):
        id, role_id = self.__auth_controller.decode_token(token)
        vacancy = self.__database_controller.get_vacancy_by_id(session, vacancy_id)
        if vacancy is None:
            return MessageModel(message=VACANCY_NOT)
        if self.__database_controller.get_selection_by_vacancy_id(
            session, id, vacancy_id
        ):
            return MessageModel(message=SELCTION_AREADY)
        today = datetime.datetime.today()
        if today < vacancy.date_end:
            intern = self.__database_controller.get_intern_by_id(session, id)
            response_status_id, passed = self.status_to_check_criteria(intern, vacancy)
            selection = Selection(vacancy_id=vacancy_id, intern_id=id, stage_id=1)
            if passed:
                tests = self.add_test(session, id)
                school = self.add_school(session, id)
                for t in tests:
                    st = SelectionBasicTest(basic_test=t)
                    selection.basic_tests.append(st)
                    selection.school = school
                selection.stage_id = 2
            response = Response(
                selection=selection, response_status_id=response_status_id, passed=False
            )
            if self.__database_controller.put_response(session, response):
                return MessageModel(message=RESPONSE_POST)
            return MessageModel(message=RESPONSE_FAILED)

        else:
            return MessageModel(message=DATE_FAILED)

    def get_my_school(self, session: Session, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        return self.__database_controller.get_school_by_id_to_front(session, id)

    def change_school(self, session: Session, token: str, school_up: UpdateScholl):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            selection = self.__database_controller.get_selection(session, school_up.id)
            selection.school.passed = school_up.passed
            selection.school.value = school_up.value
            selection.stage_id = 5
            session.commit()
            return MessageModel(message=SCHOOL_UPDATE)
        except Exception as e:
            return MessageModel(message=SCHOOL_UPDATE_FAILED)

    def get_selections_to_mentor(
        self, session: Session, token: str, organization_id: int
    ):
        id, role_id = self.__auth_controller.decode_token(token)
        return self.__database_controller.get_full_selections(
            session, id, organization_id
        )

    def get_change_selection(
        self,
        session: Session,
        token: str,
        selection_id: int,
        stage_id: int,
        background_tasks: BackgroundTasks,
    ):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            selection = self.__database_controller.get_selection_by_id(
                session, selection_id
            )
            selection.stage_id = stage_id
            msg = f"Вам отказано в стажировке на вакансию {selection.vacancy.name}"
            if stage_id == 3:
                selection.intern.internship_status_id = 2
                msg = f"По результатам собеседования вы приняты на вакансию {selection.vacancy.name}"
            session.commit()
            background_tasks.add_task(self.send_mail, selection.intern.user.email, msg)
            return MessageModel(message=ONBOARD_UPDATE)
        except Exception as e:
            return MessageModel(message=ONBOARD_UPDATE_FAILED)

    def get_interns(self, session: Session, token: str, mentors: bool):
        id, role_id = self.__auth_controller.decode_token(token)
        return self.__database_controller.get_interns(session, mentors)

    def post_task_interview(self, session: Session, task_cr: CreateTask):
        try:
            task = Task(
                vacancy_id=task_cr.vacancy_id,
                training_direction_id=task_cr.training_direction_id,
                url_portfolio=task_cr.url_task,
                mentor_id=task_cr.mentor_id,
            )
            if self.__database_controller.add_item(session, task):
                return MessageModel(message="Задание добавлено")
        except Exception as e:
            return MessageModel(message="Задание не добавлено")

    def get_to_statistic(self, session: Session):
        return self.__database_controller.get_to_statistic(session)

    def get_cnt_all_interns_by_work_experiens(self, session: Session):
        return self.__database_controller.get_cnt_all_interns_by_work_experiens(session)

    def get_cnt_all_interns_by_university(self, session: Session):
        return self.__database_controller.get_cnt_all_interns_by_university(session)

    def get_cnt_all_interns_by_direction(self, session: Session):
        return self.__database_controller.get_cnt_all_interns_by_direction(session)

    def get_result_interview(self, session: Session, organization_id: int):
        return self.__database_controller.get_result_interview(session, organization_id)

    def post_add_presence(
        self, session: Session, token: str, presence_cr: CreatePresence
    ):
        id, role_id = self.__auth_controller.decode_token(token)
        try:
            presence = Presence(
                vacancy_id=presence_cr.vacancy_id,
                intern_id=presence_cr.intern_id,
                status=presence_cr.status,
                date=presence_cr.date,
                hour=presence_cr.hour,
                mentor_id=id,
            )
            session.add(presence)
            session.commit()
            return MessageModel(message="Посещаемость добавлена")
        except Exception as e:
            return MessageModel(message="Посещаемость не добавлена")

    def get_my_presence(self, session: Session, token: str):
        id, role_id = self.__auth_controller.decode_token(token)
        return self.__database_controller.get_my_presence(session, id)

    def send_inv(self, email: str, url: str):
        try:
            result = requests.get(
                f"{settings.URL_MAILER}/inviting",
                params={"email": email, "url": url},
            )
            print(result)
            if result.status_code != 200:
                print("письмо не отправлен")
            else:
                print(result.text)
            return result
        except Exception as e:
            print(e)

    def get_invitation(
        self,
        session: Session,
        email: str,
        role_id: int,
        background_tasks: BackgroundTasks,
    ):
        try:
            code = secrets.token_urlsafe()
            session.add(
                Invation(
                    email=email,
                    role_id=role_id,
                    created=datetime.datetime.today(),
                    code=code,
                )
            )
            session.commit()
            background_tasks.add_task(
                self.send_inv,
                email,
                f"{settings.URL_INV}/auth/hidden?code={code}&role_id={role_id}",
            )
            return MessageModel(message="Приглашение отправлено")
        except Exception as e:
            return MessageModel(message="Приглашение не отправлено")
