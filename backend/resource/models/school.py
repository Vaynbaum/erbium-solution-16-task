from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.scholl import Scholl


PydanticSchollInDB = sqlalchemy_to_pydantic(Scholl)


class UpdateScholl(BaseModel):
    id: int
    value: int
    passed: bool