from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.work_experience import WorkExperience


PydanticWorkExperienceInDB = sqlalchemy_to_pydantic(WorkExperience)


class WorkExperienceToStatistic(PydanticWorkExperienceInDB):
    cnt_intern: int | None
