from sqlalchemy import ForeignKey, Integer, String, Column, Text, Float
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.branch import Branch
from database.models.organization_review import OrganizationReview
from database.models.organization_type import OrganizationType
from database.models.training_direction import TrainingDirection


class Organization(Base):
    __tablename__ = "organizations"
    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)
    description = Column(Text, nullable=True)
    img = Column(Text, nullable=True)
    address = Column(String(255), nullable=False)
    latitude = Column(Float, nullable=True)
    longitude = Column(Float, nullable=True)
    email = Column(String(50), nullable=False)
    phone = Column(String(20), nullable=False)

    training_direction_id = Column(Integer, ForeignKey("training_directions.id"))
    branch_id = Column(Integer, ForeignKey("branchs.id"))
    type_id = Column(Integer, ForeignKey("organization_types.id"))

    training_direction = relationship(TrainingDirection)
    type = relationship(OrganizationType)
    branch = relationship(Branch)
    reviews = relationship(OrganizationReview)
