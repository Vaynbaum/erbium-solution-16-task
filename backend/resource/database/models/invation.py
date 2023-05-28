from sqlalchemy import ForeignKey, Integer, String, Column, DateTime
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.role import Role


class Invation(Base):
    __tablename__ = "invations"
    code = Column(String(255), primary_key=True)

    email = Column(String(255), nullable=False)
    role_id = Column(Integer, ForeignKey("roles.id"))
    created = Column(DateTime, nullable=False)

    role = relationship(Role)
