from sqlalchemy import Integer, String, Column

from database.base import Base


class TypeBasicTest(Base):
    __tablename__ = "type_basic_tests"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
