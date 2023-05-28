from sqlalchemy import ForeignKey, Integer, Column

from database.base import Base


class SkillIntern(Base):
    __tablename__ = "skill_interns"
    skill_id = Column(Integer(), ForeignKey("skills.id"), primary_key=True)
    intern_id = Column(Integer(), ForeignKey("interns.id"), primary_key=True)
