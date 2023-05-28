from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.region import Region


PydanticRegionInDB = sqlalchemy_to_pydantic(Region)
