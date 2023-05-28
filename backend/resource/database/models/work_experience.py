from sqlalchemy import Integer, String, Column
from sqlalchemy.orm import relationship

from database.base import Base


class WorkExperience(Base):
    __tablename__ = "work_experiences"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

    interns = relationship("Intern", backref="work_experience")
