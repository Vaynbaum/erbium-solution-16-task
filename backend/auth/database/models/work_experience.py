from sqlalchemy import Integer, String, Column

from database.base import Base


class WorkExperience(Base):
    __tablename__ = "work_experiences"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
