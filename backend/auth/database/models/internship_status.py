from sqlalchemy import Integer, String, Column

from database.base import Base


class InternshipStatus(Base):
    __tablename__ = "internship_statuses"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
