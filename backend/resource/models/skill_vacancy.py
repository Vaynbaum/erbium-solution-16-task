from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.skill_vacancy import SkillVacancy
from models.skill import PydanticSkillInDB


PydanticSkillVacancyInDB = sqlalchemy_to_pydantic(SkillVacancy)


class SkillVacancyWithSkill(PydanticSkillVacancyInDB):
    skill: PydanticSkillInDB
