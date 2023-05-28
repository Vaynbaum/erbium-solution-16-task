from sqlalchemy import Integer, String, Column

from database.base import Base


class WorkSchedule(Base):
    __tablename__ = "work_schedules"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
