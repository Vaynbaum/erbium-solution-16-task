from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.basic_test_statuse import BasicTestStatuse




PydanticBasicTestStatuseInDB = sqlalchemy_to_pydantic(BasicTestStatuse)
