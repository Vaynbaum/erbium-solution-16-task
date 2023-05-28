from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.vacancy_status import VacancyStatus


PydanticVacancyStatusInDB = sqlalchemy_to_pydantic(VacancyStatus)
