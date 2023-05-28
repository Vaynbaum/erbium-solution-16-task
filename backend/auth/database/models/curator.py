from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.training_direction import TrainingDirection


class Curator(Base):
    __tablename__ = "curators"
    id = Column(Integer, ForeignKey("users.id"), primary_key=True)
    training_direction_id = Column(Integer, ForeignKey("training_directions.id"))

    training_direction = relationship(TrainingDirection)
