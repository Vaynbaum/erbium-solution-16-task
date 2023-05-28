from sqlalchemy import ForeignKey, Integer, Column

from database.base import Base


class LanguageIntern(Base):
    __tablename__ = "language_interns"
    language_id = Column(Integer(), ForeignKey("languages.id"), primary_key=True)
    intern_id = Column(Integer(), ForeignKey("interns.id"), primary_key=True)
