from sqlalchemy import Boolean, DateTime, ForeignKey, Integer, String, Column, Text
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.duty import Duty
from database.models.condition import Condition
from database.models.employment_type import EmploymentType
from database.models.hr import HR
from database.models.mentor import Mentor
from database.models.requirement import Requirement
from database.models.selection import Selection
from database.models.skill_vacancy import SkillVacancy
from database.models.vacancy_status import VacancyStatus
from database.models.work_experience import WorkExperience
from database.models.work_schedule import WorkSchedule


class Vacancy(Base):
    __tablename__ = "vacancies"
    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    description = Column(Text, nullable=True)
    min_salary = Column(Integer, nullable=True)
    max_salary = Column(Integer, nullable=True)
    date_begin = Column(DateTime, nullable=False)
    date_end = Column(DateTime, nullable=False)
    published = Column(Boolean, nullable=False)

    work_schedule_id = Column(Integer, ForeignKey("work_schedules.id"))
    organization_id = Column(Integer, ForeignKey("organizations.id"))
    employment_type_id = Column(Integer, ForeignKey("employment_types.id"))
    hr_creater_id = Column(Integer, ForeignKey("hrs.id"))
    mentor_id = Column(Integer, ForeignKey("mentors.id"))
    work_experience_id = Column(Integer, ForeignKey("work_experiences.id"))
    status_id = Column(Integer, ForeignKey("vacancy_statuses.id"))
    cnt_intern = Column(Integer, nullable=True, default=0)

    work_schedule = relationship(WorkSchedule)
    employment_type = relationship(EmploymentType)
    hr_creater = relationship(HR)
    mentor = relationship(Mentor)
    work_experience = relationship(WorkExperience)
    status = relationship(VacancyStatus)

    skills = relationship(SkillVacancy, backref="vacancy", cascade="all,delete")
    requirements = relationship(Requirement, backref="vacancy", cascade="all,delete")
    conditions = relationship(Condition, backref="vacancy", cascade="all,delete")
    duties = relationship(Duty, backref="vacancy", cascade="all,delete")
    selections = relationship(Selection, backref="vacancy", cascade="all,delete")
