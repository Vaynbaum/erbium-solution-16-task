from sqlalchemy import ForeignKey, Integer, Text, Column, Boolean

from database.base import Base


class Scholl(Base):
    __tablename__ = "scholls"
    id = Column(Integer, primary_key=True)
    value = Column(Integer, nullable=True)
    comment = Column(Text, nullable=True)
    passed = Column(Boolean, nullable=True)
    intern_id = Column(Integer, ForeignKey("interns.id"))
