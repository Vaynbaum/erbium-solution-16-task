from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.skill import Skill


PydanticSkillInDB = sqlalchemy_to_pydantic(Skill)
