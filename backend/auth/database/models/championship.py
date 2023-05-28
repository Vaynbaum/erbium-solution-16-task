from sqlalchemy import ForeignKey, Integer, Text, Column, Boolean

from database.base import Base


class Championship(Base):
    __tablename__ = "championships"
    id = Column(Integer, primary_key=True)
    value = Column(Integer, nullable=True)
    comment = Column(Text, nullable=True)
    selection_id = Column(Integer(), ForeignKey("selections.id"))
    passed = Column(Boolean, nullable=True)
