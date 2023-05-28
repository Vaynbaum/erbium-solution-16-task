from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.requirement import Requirement


PydanticRequirementInDB = sqlalchemy_to_pydantic(Requirement)
