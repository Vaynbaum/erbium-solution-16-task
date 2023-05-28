from sqlalchemy import Integer, String, Column

from database.base import Base


class Metro(Base):
    __tablename__ = "metros"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
