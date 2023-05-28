from sqlalchemy.orm import Session, subqueryload

from common.phrases import (
    PUT_RECOVER_DATA_FAILDE,
    PUT_USER_DATA_FAILDE,
    UPDATE_USER_DATA_FAILDE,
)
from database.base import Base, Engine
from database.models.permission import Permission
from database.models.recovery import Recovery
from database.models.role import Role
from database.models.citizenship import Citizenship
from database.models.region import Region
from database.models.course import Course
from database.models.intern import Intern
from database.models.direction import Direction
from database.models.internship_status import InternshipStatus
from database.models.city import City
from database.models.university import University
from database.models.user import User

from exceptions.db_exception import DBException
from models.recovery import RecoveryWithUser

from models.user import UserWithRoleInDB


class DatabaseController:
    def __init__(self) -> None:
        Base.metadata.create_all(Engine)

    def get_user_by_email(
        self, session: Session, email: str
    ) -> UserWithRoleInDB | None:
        user = session.query(User).filter(User.email == email).first()
        return UserWithRoleInDB.from_orm(user) if user else None

    def get_role_by_name(self, session: Session, name: str):
        role = session.query(Role).filter(Role.name == name).first()
        return role

    def get_internship_status_by_name(self, session: Session, name: str):
        role = (
            session.query(InternshipStatus)
            .filter(InternshipStatus.name == name)
            .first()
        )
        return role

    def put_city(self, session: Session, city: City):
        res = self.get_city_by_name(session, city.name)
        if res:
            return res
        session.add(city)
        session.commit()
        return self.get_city_by_name(session, city.name)

    def get_city_by_name(self, session: Session, name: str):
        return session.query(City).filter(City.name == name).first()

    def put_citizenship(self, session: Session, citizenship: Citizenship):
        res = self.get_citizenship_by_name(session, citizenship.name)
        if res:
            return res
        session.add(citizenship)
        session.commit()
        return self.get_citizenship_by_name(session, citizenship.name)

    def get_citizenship_by_name(self, session: Session, name: str):
        return session.query(Citizenship).filter(Citizenship.name == name).first()

    def put_course(self, session: Session, course: Course):
        res = self.get_course_by_name(session, course.name)
        if res:
            return res
        session.add(course)
        session.commit()
        return self.get_course_by_name(session, course.name)

    def get_course_by_name(self, session: Session, name: str):
        return session.query(Course).filter(Course.name == name).first()

    def put_direction(self, session: Session, direction: Direction):
        res = self.get_direction_by_name(session, direction.name)
        if res:
            return res
        session.add(direction)
        session.commit()
        return self.get_direction_by_name(session, direction.name)

    def get_direction_by_name(self, session: Session, name: str):
        return session.query(Direction).filter(Direction.name == name).first()

    def put_university(self, session: Session, university: University):
        res = self.get_university_by_name(session, university.name)
        if res:
            return res
        session.add(university)
        session.commit()
        return self.get_university_by_name(session, university.name)

    def get_university_by_name(self, session: Session, name: str):
        return session.query(University).filter(University.name == name).first()

    def put_region(self, session: Session, region: Region):
        res = self.get_region_by_name(session, region.name)
        if res:
            return res
        session.add(region)
        session.commit()
        return self.get_region_by_name(session, region.name)

    def get_region_by_name(self, session: Session, name: str):
        return session.query(Region).filter(Region.name == name).first()

    def put_inter_user(self, session: Session, user: Intern):
        try:
            session.add(user)
            session.commit()
            return self.get_user_by_email(session, user.user.email)
        except Exception:
            raise DBException(PUT_USER_DATA_FAILDE)

    def update_user(self, session: Session, user: User):
        try:
            session.add(user)
            session.commit()
            return True
        except Exception:
            raise DBException(UPDATE_USER_DATA_FAILDE)

    def put_recover_code(self, session: Session, data: Recovery):
        try:
            session.add(data)
            session.commit()
            return True
        except:
            raise DBException(PUT_RECOVER_DATA_FAILDE)

    def get_recover_data(self, session: Session, code: str):
        return session.query(Recovery).options(subqueryload(Recovery.user)).get(code)

    def delete_recover_data(
        self, session: Session, code: str | None = None, user_id: int | None = None
    ):
        if code:
            session.delete(session.query(Recovery).get(code))
        elif user_id:
            session.query(Recovery).filter(Recovery.user_id == user_id).delete()
        session.commit()
