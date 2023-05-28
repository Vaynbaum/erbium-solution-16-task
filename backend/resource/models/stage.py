from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.stage import Stage


PydanticStageInDB = sqlalchemy_to_pydantic(Stage)
