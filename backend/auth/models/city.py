from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.city import City


PydanticCityInDB = sqlalchemy_to_pydantic(City)


