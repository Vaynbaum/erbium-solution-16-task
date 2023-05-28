from sqlalchemy import ForeignKey, Integer, String, Column
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.city import City


class University(Base):
    __tablename__ = "universities"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    sub = Column(String(100), nullable=False)
    city_id = Column(Integer, ForeignKey("cities.id"), nullable=True)
    city = relationship(City)

    interns = relationship("Intern", backref="university")
