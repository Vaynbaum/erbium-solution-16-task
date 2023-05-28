from typing import List
from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.intern import Intern
from models.branch import PydanticBranchInDB
from models.cource import PydanticCourseInDB
from models.direction import PydanticDirectionInDB
from models.internship_status import PydanticInternshipStatusInDB
from models.organization import PydanticOrganizationInDB
from models.short_user import ShortUser
from models.skill_intern import SkillInternWithSkill
from models.training_direction import PydanticTrainingDirectionInDB
from models.university import PydanticUniversityInDB
from models.work_experience import PydanticWorkExperienceInDB


PydanticInternInDB = sqlalchemy_to_pydantic(Intern)


class FullIntern(PydanticInternInDB):
    university: PydanticUniversityInDB
    course: PydanticCourseInDB
    direction: PydanticDirectionInDB
    internship_status: PydanticInternshipStatusInDB
    branch: PydanticBranchInDB | None
    organization: PydanticOrganizationInDB | None
    skills: List[SkillInternWithSkill]
    work_experience: PydanticWorkExperienceInDB | None

    training_direction: PydanticTrainingDirectionInDB | None


class UpdateInternModel(BaseModel):
    course_id: int
    direction_id: int
    university_id: int
    organization_id: int | None
    training_direction_id: int | None
    about_me: str | None
    branch_id: int | None
    github: str | None
    vk: str | None
    portfolio: str | None
    organizations: str | None
    work_experience_id: int | None


class InternSelection(PydanticInternInDB):
    user: ShortUser
    university: PydanticUniversityInDB
    course: PydanticCourseInDB

