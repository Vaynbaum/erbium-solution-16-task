from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.metro import Metro


PydanticMetroInDB = sqlalchemy_to_pydantic(Metro)
