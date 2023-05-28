from sqlalchemy import ForeignKey, Integer, Column

from database.base import Base


class SkillVacancy(Base):
    __tablename__ = "skill_vacancies"
    skill_id = Column(Integer(), ForeignKey("skills.id"), primary_key=True)
    vacancy_id = Column(Integer(), ForeignKey("vacancies.id"), primary_key=True)
