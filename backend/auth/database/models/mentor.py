from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.mentor_review import MentorReview


class Mentor(Base):
    __tablename__ = "mentors"
    id = Column(Integer, ForeignKey("users.id"), primary_key=True)
    organization_id = Column(Integer, ForeignKey("organizations.id"))
    reviews = relationship(MentorReview, backref="mentor", cascade="all,delete")
    tasks = relationship("Task", backref="mentor", cascade="all,delete")
    presences = relationship("Presence", backref="mentor", cascade="all,delete")
