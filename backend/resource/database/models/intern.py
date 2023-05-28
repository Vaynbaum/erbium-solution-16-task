from sqlalchemy import Integer, Column, ForeignKey, Boolean, String, Text
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.basic_test import BasicTest
from database.models.branch import Branch
from database.models.course import Course
from database.models.direction import Direction
from database.models.internship_status import InternshipStatus
from database.models.language_intern import LanguageIntern
from database.models.mentor_review import MentorReview
from database.models.organization import Organization
from database.models.organization_review import OrganizationReview
from database.models.scholl import Scholl
from database.models.selection import Selection
from database.models.skill_intern import SkillIntern
from database.models.vacancy_review import VacancyReview


class Intern(Base):
    __tablename__ = "interns"
    id = Column(Integer, ForeignKey("users.id"), primary_key=True)
    university_id = Column(Integer, ForeignKey("universities.id"))
    course_id = Column(Integer, ForeignKey("courses.id"))
    direction_id = Column(Integer, ForeignKey("directions.id"))
    internship_status_id = Column(Integer, ForeignKey("internship_statuses.id"))
    training_direction_id = Column(Integer, ForeignKey("training_directions.id"))
    branch_id = Column(Integer, ForeignKey("branchs.id"))
    volunteering = Column(Boolean, nullable=True)
    about_me = Column(Text, nullable=True)
    github = Column(String(255), nullable=True)
    vk = Column(String(255), nullable=True)
    portfolio = Column(String(255), nullable=True)
    url_portfolio = Column(String(255), nullable=True)

    organization_id = Column(Integer, ForeignKey("organizations.id"))

    course = relationship(Course)
    direction = relationship(Direction)
    internship_status = relationship(InternshipStatus)
    branch = relationship(Branch)
    presences = relationship("Presence", backref="intern", cascade="all,delete")
    skills = relationship(SkillIntern, backref="intern", cascade="all,delete")
    languages = relationship(LanguageIntern, backref="intern", cascade="all,delete")
    selections = relationship(Selection, backref="intern", cascade="all,delete")

    organization_reviews = relationship(
        OrganizationReview, backref="intern", cascade="all,delete"
    )
    vacancy_reviews = relationship(
        VacancyReview, backref="intern", cascade="all,delete"
    )
    mentor_reviews = relationship(MentorReview, backref="intern", cascade="all,delete")

    organizations = Column(String(255), nullable=True)
    organization = relationship(Organization)
    organization_reviews = relationship(OrganizationReview)

    work_experience_id = Column(Integer, ForeignKey("work_experiences.id"))
    basic_tests = relationship(BasicTest, cascade="all,delete")
    school = relationship(Scholl, backref="intern", uselist=False, cascade="all,delete")
