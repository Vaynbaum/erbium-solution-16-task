from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.response_statuse import ResponseStatuse


PydanticResponseStatuseInDB = sqlalchemy_to_pydantic(ResponseStatuse)


