from sqlalchemy import DateTime, Integer, String, Column, ForeignKey
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.user import User


class Recovery(Base):
    __tablename__ = "recoveries"
    code = Column(String(255), primary_key=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    created = Column(DateTime, nullable=False)

    user = relationship(User)
