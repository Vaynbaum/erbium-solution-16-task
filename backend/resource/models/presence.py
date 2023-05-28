from datetime import datetime
from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.presence import Presence


PydanticPresence = sqlalchemy_to_pydantic(Presence)


class CreatePresence(BaseModel):
    intern_id: int
    vacancy_id: int
    status: str
    hour: int
    date: datetime | int


class FullPresence(PydanticPresence):
    ...
