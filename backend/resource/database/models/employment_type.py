from sqlalchemy import Integer, String, Column

from database.base import Base


class EmploymentType(Base):
    __tablename__ = "employment_types"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
