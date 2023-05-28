from sqlalchemy import Integer, String, Column

from database.base import Base


class BasicTestStatuse(Base):
    __tablename__ = "basic_test_statuses"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
