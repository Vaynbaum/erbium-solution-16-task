from sqlalchemy import Integer, String, Column

from database.base import Base


class Stage(Base):
    __tablename__ = "stages"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
