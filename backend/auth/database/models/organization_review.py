from sqlalchemy import ForeignKey, Integer, Column, Text

from database.base import Base


class OrganizationReview(Base):
    __tablename__ = "organization_reviews"
    id = Column(Integer, primary_key=True)
    text = Column(Text, nullable=False)
    value = Column(Integer, nullable=False)

    organization_id = Column(Integer, ForeignKey("organizations.id"))
    intern_id = Column(Integer, ForeignKey("interns.id"))
