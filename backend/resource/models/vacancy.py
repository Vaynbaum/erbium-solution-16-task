import datetime
from typing import List
from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.vacancy import Vacancy
from models.condition import PydanticConditionInDB
from models.duty import PydanticDutyInDB
from models.employment_type import PydanticEmploymentTypeInDB
from models.organization import OrganizationWithTrainingDirection, ShortOrganization
from models.requirement import PydanticRequirementInDB
from models.skill_vacancy import SkillVacancyWithSkill
from models.vacancy_status import PydanticVacancyStatusInDB
from models.work_experience import PydanticWorkExperienceInDB
from models.work_schedule import PydanticWorkScheduleInDB


PydanticVacancyInDB = sqlalchemy_to_pydantic(Vacancy)


class ShortVacancy(PydanticVacancyInDB):
    organization: ShortOrganization


class FullVacancy(PydanticVacancyInDB):
    organization: OrganizationWithTrainingDirection
    skills: List[SkillVacancyWithSkill]
    requirements: List[PydanticRequirementInDB]
    conditions: List[PydanticConditionInDB]
    duties: List[PydanticDutyInDB]
    work_experience: PydanticWorkExperienceInDB
    work_schedule: PydanticWorkScheduleInDB
    employment_type: PydanticEmploymentTypeInDB
    status: PydanticVacancyStatusInDB


class CreateVacancy(BaseModel):
    name: str
    description: str
    work_schedule_id: int
    organization_id: int
    employment_type_id: int
    hr_creater_id: int
    min_salary: int
    max_salary: int
    work_experience_id: int
    date_begin: datetime.datetime | int
    date_end: datetime.datetime | int
    cnt_intern: int
    conditions: List[str]
    requirements: List[str]
    duties: List[str]
    skills: List[str]
