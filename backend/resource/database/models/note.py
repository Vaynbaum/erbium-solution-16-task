from sqlalchemy import Integer, Text, DateTime, Boolean, Column, ForeignKey

from database.base import Base


class Note(Base):
    __tablename__ = "notes"
    id = Column(Integer, primary_key=True)
    text = Column(Text, nullable=False)
    created = Column(DateTime, nullable=False)
    user_id = Column(Integer, ForeignKey("users.id"))
    is_readed = Column(Boolean, default=False)
