from sqlalchemy import Integer, String, Column

from database.base import Base


class Direction(Base):
    __tablename__ = "directions"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
