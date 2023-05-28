from sqlalchemy import Integer, String, Column, ForeignKey, Date, Boolean
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.citizenship import Citizenship
from database.models.city import City
from database.models.curator import Curator
from database.models.hr import HR
from database.models.intern import Intern
from database.models.mentor import Mentor
from database.models.role import Role


class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True)
    email = Column(String(50), nullable=False)
    phone = Column(String(20), nullable=False)
    password = Column(String(255), nullable=False)
    firstname = Column(String(20), nullable=False)
    lastname = Column(String(20), nullable=False)
    patronymic = Column(String(20), nullable=True)
    birthdate = Column(Date, nullable=False)
    img = Column(String(255), nullable=True)
    nickname = Column(String(255), nullable=False)
    is_verified = Column(Boolean, nullable=False, default=False)
    gender = Column(Boolean, nullable=True)

    role_id = Column(Integer, ForeignKey("roles.id"))
    city_id = Column(Integer, ForeignKey("cities.id"))
    citizenship_id = Column(Integer, ForeignKey("citizenships.id"))

    intern = relationship(Intern, backref="user", uselist=False, cascade="all,delete")
    hr = relationship(HR, backref="user", uselist=False, cascade="all,delete")
    curator = relationship(Curator, backref="user", uselist=False, cascade="all,delete")
    mentor = relationship(Mentor, backref="user", uselist=False, cascade="all,delete")

    role = relationship(Role)
    city = relationship(City)
    citizenship = relationship(Citizenship)
