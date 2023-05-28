from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.work_schedule import WorkSchedule


PydanticWorkScheduleInDB = sqlalchemy_to_pydantic(WorkSchedule)
