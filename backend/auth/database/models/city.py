from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.region import Region


class City(Base):
    __tablename__ = "cities"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

    region_id = Column(Integer, ForeignKey("regions.id"))
    region = relationship(Region)
