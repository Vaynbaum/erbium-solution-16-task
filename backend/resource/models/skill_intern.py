from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.skill_intern import SkillIntern
from models.skill import PydanticSkillInDB


PydanticSkillInternInDB = sqlalchemy_to_pydantic(SkillIntern)


class SkillInternWithSkill(PydanticSkillInternInDB):
    skill: PydanticSkillInDB
