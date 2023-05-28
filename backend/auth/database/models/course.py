from sqlalchemy import Integer, String, Column

from database.base import Base


class Course(Base):
    __tablename__ = "courses"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
