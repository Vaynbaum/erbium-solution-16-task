from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.role import Role

PydanticRoleInDB = sqlalchemy_to_pydantic(Role)
