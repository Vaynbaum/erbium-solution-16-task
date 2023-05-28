from sqlalchemy import ForeignKey, Integer, Column, String

from database.base import Base


class Requirement(Base):
    __tablename__ = "requirements"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    vacancy_id = Column(Integer, ForeignKey("vacancies.id"))
