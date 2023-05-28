from sqlalchemy import Integer, Column, ForeignKey
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.organization import Organization


class HR(Base):
    __tablename__ = "hrs"
    id = Column(Integer, ForeignKey("users.id"), primary_key=True)
    organization_id = Column(Integer, ForeignKey("organizations.id"))

    organization = relationship(Organization)
