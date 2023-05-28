from sqlalchemy import Integer, String, Column

from database.base import Base


class ResponseStatuse(Base):
    __tablename__ = "response_statuses"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
