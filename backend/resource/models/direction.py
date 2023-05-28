from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.direction import Direction


PydanticDirectionInDB = sqlalchemy_to_pydantic(Direction)
