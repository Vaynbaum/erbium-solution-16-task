from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.citizenship import Citizenship


PydanticCitizenshipInDB = sqlalchemy_to_pydantic(Citizenship)
