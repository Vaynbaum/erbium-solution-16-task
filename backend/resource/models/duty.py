from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.duty import Duty


PydanticDutyInDB = sqlalchemy_to_pydantic(Duty)
