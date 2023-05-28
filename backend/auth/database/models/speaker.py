from sqlalchemy import Integer, String, Column

from database.base import Base


class Speaker(Base):
    __tablename__ = "speakers"
    id = Column(Integer, primary_key=True)
    email = Column(String(50), nullable=False)
    password = Column(String(255), nullable=False)
    firstname = Column(String(20), nullable=False)
    lastname = Column(String(20), nullable=False)
    patronymic = Column(String(20), nullable=True)
    img = Column(String(255), nullable=True)
