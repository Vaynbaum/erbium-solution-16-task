from sqlalchemy import ForeignKey, Integer, Text, Column, Boolean, DateTime
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.mentor import Mentor
from database.models.type_interview import TypeInterview


class Interview(Base):
    __tablename__ = "interviews"
    id = Column(Integer, primary_key=True)
    comment = Column(Text, nullable=True)
    name = Column(Text, nullable=False)
    answer = Column(Text, nullable=True)
    value = Column(Integer, nullable=True)
    type_interview_id = Column(Integer(), ForeignKey("type_interviews.id"))
    selection_id = Column(Integer(), ForeignKey("selections.id"))
    mentor_id = Column(Integer(), ForeignKey("mentors.id"))
    passed = Column(Boolean, nullable=True)
    date = Column(DateTime, nullable=False)

    type_interview = relationship(TypeInterview)
    mentor = relationship(Mentor)
