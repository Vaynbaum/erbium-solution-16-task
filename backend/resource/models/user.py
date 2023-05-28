import datetime
from pydantic import BaseModel, EmailStr, Field, SecretStr
from database.models.user import User
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from models.citizenship import PydanticCitizenshipInDB
from models.city import CityWithRegionInDB
from models.curator import PydanticCuratorInDB
from models.hr import FullHR
from models.intern import FullIntern
from models.mentor import FullMentor

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
    city_id: int
    citizenship_id: int
    university_id: int
    course_id: int
    direction_id: int


class UpdateUserModel(BaseModel):
    firstname: str
    lastname: str
    patronymic: str
    birthdate: datetime.date | int
    phone: str
    email: str
    gender: bool
    city_id: int
    citizenship_id: int


PydanticUserInDB = sqlalchemy_to_pydantic(User)


class UserWithRoleInDB(PydanticUserInDB):
    role: PydanticRoleInDB


class FullUser(UserWithRoleInDB):
    password: str | SecretStr = Field(..., exclude=True)
    intern: FullIntern | None
    hr: FullHR | None
    curator: PydanticCuratorInDB | None
    mentor: FullMentor | None
    city: CityWithRegionInDB
    citizenship: PydanticCitizenshipInDB
    rating: int | None = None

    class Config:
        orm_mode = True
        exclude = ["password"]
