from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.city import City
from models.region import PydanticRegionInDB


PydanticCityInDB = sqlalchemy_to_pydantic(City)


class CityWithRegionInDB(PydanticCityInDB):
    region: PydanticRegionInDB
