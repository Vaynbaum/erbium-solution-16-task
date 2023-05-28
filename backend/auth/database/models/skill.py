from sqlalchemy import Integer, String, Column
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.skill_intern import SkillIntern
from database.models.skill_vacancy import SkillVacancy


class Skill(Base):
    __tablename__ = "skills"
    id = Column(Integer, primary_key=True)
    name = Column(String(100), nullable=False)

    vacancies = relationship(SkillVacancy, backref="skill")
    interns = relationship(SkillIntern, backref="skill")
