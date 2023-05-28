from sqlalchemy import Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.role import Role


class Permission(Base):
    __tablename__ = "permissions"
    role_id = Column(Integer, ForeignKey("roles.id"), primary_key=True)
    url = Column(String(20), primary_key=True)
    type = Column(String(6), primary_key=True)

    role = relationship(Role)
