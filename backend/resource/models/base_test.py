from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.basic_test import BasicTest
from models.basic_test_statuse import PydanticBasicTestStatuseInDB
from models.type_basic_test import PydanticTypeBasicTestInDB


PydanticBasicTestInDB = sqlalchemy_to_pydantic(BasicTest)


class FullBasicTest(PydanticBasicTestInDB):
    type_basic_test: PydanticTypeBasicTestInDB
    basic_test_status: PydanticBasicTestStatuseInDB


class UpdateTest(BaseModel):
    id: int
    value: int
    passed: bool
    status_id: int
