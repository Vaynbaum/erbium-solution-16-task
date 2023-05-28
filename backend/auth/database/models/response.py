from sqlalchemy import ForeignKey, Integer, Text, Column, Boolean
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.response_statuse import ResponseStatuse


class Response(Base):
    __tablename__ = "responses"
    id = Column(Integer, primary_key=True)
    comment = Column(Text, nullable=True)
    response_status_id = Column(Integer(), ForeignKey("response_statuses.id"))
    selection_id = Column(Integer(), ForeignKey("selections.id"))
    passed = Column(Boolean, nullable=True)
    response_status = relationship(ResponseStatuse)
