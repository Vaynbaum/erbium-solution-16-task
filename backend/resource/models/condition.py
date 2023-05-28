from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.condition import Condition


PydanticConditionInDB = sqlalchemy_to_pydantic(Condition)
