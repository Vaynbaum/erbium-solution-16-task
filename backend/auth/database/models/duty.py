from sqlalchemy import ForeignKey, Integer, Column, String

from database.base import Base


class Duty(Base):
    __tablename__ = "duties"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    vacancy_id = Column(Integer, ForeignKey("vacancies.id"))
