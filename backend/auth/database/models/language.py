from sqlalchemy import Integer, String, Column
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.language_intern import LanguageIntern


class Language(Base):
    __tablename__ = "languages"
    id = Column(Integer, primary_key=True)
    name = Column(String(255), nullable=False)

    interns = relationship(LanguageIntern, backref="language")