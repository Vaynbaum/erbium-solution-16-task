from sqlalchemy import ForeignKey, Integer, Column, String
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.training_direction import TrainingDirection
from database.models.vacancy import Vacancy


class Task(Base):
    __tablename__ = "tasks"
    id = Column(Integer, primary_key=True)
    vacancy_id = Column(Integer, ForeignKey("vacancies.id"))
    training_direction_id = Column(Integer, ForeignKey("training_directions.id"))
    mentor_id = Column(Integer, ForeignKey("mentors.id"))
    url_portfolio = Column(String(255), nullable=False)

    vacancy = relationship(Vacancy)
    training_direction = relationship(TrainingDirection)
