from sqlalchemy import Integer, String, Column
from sqlalchemy.orm import relationship

from database.base import Base


class TrainingDirection(Base):
    __tablename__ = "training_directions"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)
    organizations = relationship("Organization", backref="training_direction")
    interns = relationship("Intern", backref="training_direction")
