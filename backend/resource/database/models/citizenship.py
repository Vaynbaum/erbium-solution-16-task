from sqlalchemy import Integer, String, Column
from database.base import Base


class Citizenship(Base):
    __tablename__ = "citizenships"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
