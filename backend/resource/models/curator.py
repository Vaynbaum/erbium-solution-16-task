from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.curator import Curator


PydanticCuratorInDB = sqlalchemy_to_pydantic(Curator)
