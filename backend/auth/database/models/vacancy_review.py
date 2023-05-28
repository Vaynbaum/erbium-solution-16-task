from sqlalchemy import ForeignKey, Integer, Column, Text
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.vacancy import Vacancy


class VacancyReview(Base):
    __tablename__ = "vacancy_reviews"
    id = Column(Integer, primary_key=True)
    text = Column(Text, nullable=False)
    value = Column(Integer, nullable=False)

    vacancy_id = Column(Integer, ForeignKey("vacancies.id"))
    intern_id = Column(Integer, ForeignKey("interns.id"))

    vacancy = relationship(Vacancy)
