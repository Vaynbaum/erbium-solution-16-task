from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.university import University


PydanticUniversityInDB = sqlalchemy_to_pydantic(University)


class UniversityToStatistic(PydanticUniversityInDB):
    cnt_intern: int | None