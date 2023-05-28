from sqlalchemy import ForeignKey, Integer, Column, String

from database.base import Base


class Condition(Base):
    __tablename__ = "conditions"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    vacancy_id = Column(Integer, ForeignKey("vacancies.id"))
