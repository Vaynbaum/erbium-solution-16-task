from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.course import Course


PydanticCourseInDB = sqlalchemy_to_pydantic(Course)
