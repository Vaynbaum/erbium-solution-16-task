from sqlalchemy import Integer, String, Column

from database.base import Base


class Branch(Base):
    __tablename__ = "branchs"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
