from sqlalchemy import Integer, String, Column

from database.base import Base


class TypeInterview(Base):
    __tablename__ = "type_interviews"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
