from sqlalchemy import Integer, String, Column

from database.base import Base


class VacancyStatus(Base):
    __tablename__ = "vacancy_statuses"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
