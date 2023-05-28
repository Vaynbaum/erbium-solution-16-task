from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.type_basic_test import TypeBasicTest





PydanticTypeBasicTestInDB = sqlalchemy_to_pydantic(TypeBasicTest)
