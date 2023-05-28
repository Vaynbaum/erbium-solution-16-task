import datetime
from pydantic import BaseModel, EmailStr
from database.models.user import User
from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from models.role import PydanticRoleInDB


class SigninModel(BaseModel):
    username: str
    password: str


class SignupModel(BaseModel):
    firstname: str
    lastname: str
    patronymic: str | None = None
    birthdate: datetime.date
    phone: str
    password: str
    email: EmailStr
    city: int | str
    region: int | str
    citizenship: int | str
    university: int | str
    course: int | str
    direction: int | str


class SignupHiddenModel(BaseModel):
    firstname: str
    lastname: str
    patronymic: str | None = None
    birthdate: datetime.date
    phone: str
    password: str
    email: EmailStr
    city_id: int
    citizenship_id: int
    code: str
    organization_id: int | None = None
    training_direction_id: int | None = None


PydanticUserInDB = sqlalchemy_to_pydantic(User)


class UserWithRoleInDB(PydanticUserInDB):
    role: PydanticRoleInDB
