from sqlalchemy import ForeignKey, Integer, Column, String, DateTime
from sqlalchemy.orm import relationship

from database.base import Base


class Presence(Base):
    __tablename__ = "presences"
    id = Column(Integer, primary_key=True)
    intern_id = Column(Integer(), ForeignKey("interns.id"))
    vacancy_id = Column(Integer(), ForeignKey("vacancies.id"))
    mentor_id = Column(Integer(), ForeignKey("mentors.id"))
    status = Column(String(30))
    date = Column(DateTime())
    hour = Column(Integer())
    vacancy = relationship("Vacancy", backref="presences")
