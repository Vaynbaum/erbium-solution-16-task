from sqlalchemy import ForeignKey, Integer, String, Column, Text, DateTime
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.speaker import Speaker


class Event(Base):
    __tablename__ = "events"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    description = Column(Text, nullable=True)
    date = Column(DateTime, nullable=False)
    speaker_id = Column(Integer(), ForeignKey("speakers.id"))
    speaker = relationship(Speaker)
