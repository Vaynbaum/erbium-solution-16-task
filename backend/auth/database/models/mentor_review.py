from sqlalchemy import ForeignKey, Integer, Column, Text

from database.base import Base


class MentorReview(Base):
    __tablename__ = "mentor_reviews"
    id = Column(Integer, primary_key=True)
    text = Column(Text, nullable=False)
    value = Column(Integer, nullable=False)

    mentor_id = Column(Integer, ForeignKey("mentors.id"))
    intern_id = Column(Integer, ForeignKey("interns.id"))
