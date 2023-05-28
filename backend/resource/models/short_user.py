from database.models.user import User
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from models.citizenship import PydanticCitizenshipInDB
from models.city import CityWithRegionInDB


PydanticUserInDB = sqlalchemy_to_pydantic(User)


class ShortUser(PydanticUserInDB):
    city: CityWithRegionInDB
    citizenship: PydanticCitizenshipInDB
