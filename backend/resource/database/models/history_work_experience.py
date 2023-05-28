from sqlalchemy import ForeignKey, Integer, Column, String, Text
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.intern import Intern


class HistoryWorkExperience(Base):
    __tablename__ = "history_work_experiences"
    id = Column(Integer, primary_key=True)
    organization = Column(String(255), nullable=False)
    post = Column(String(255), nullable=False)
    year_begin = Column(Integer, nullable=False)
    year_end = Column(Integer, nullable=False)

    intern_id = Column(Integer, ForeignKey("interns.id"))

    intern = relationship(Intern)
