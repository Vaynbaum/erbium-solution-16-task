from sqlalchemy import ForeignKey, Integer, Column
from sqlalchemy.orm import relationship
from database.base import Base
from database.models.championship import Championship
from database.models.interview import Interview
from database.models.scholl import Scholl
from database.models.selection_basic_test import SelectionBasicTest
from database.models.stage import Stage
from database.models.response import Response


class Selection(Base):
    __tablename__ = "selections"
    id = Column(Integer, primary_key=True)
    vacancy_id = Column(Integer(), ForeignKey("vacancies.id"))
    stage_id = Column(Integer(), ForeignKey("stages.id"))
    intern_id = Column(Integer(), ForeignKey("interns.id"))
    school_id = Column(Integer(), ForeignKey("scholls.id"))
    stage = relationship(Stage)
    response = relationship(
        Response, backref="selection", uselist=False, cascade="all,delete"
    )
    basic_tests = relationship(
        SelectionBasicTest, backref="selection", cascade="all,delete"
    )

    school = relationship(Scholl)
    championship = relationship(
        Championship, backref="selection", uselist=False, cascade="all,delete"
    )
    interview = relationship(
        Interview, backref="selection", uselist=False, cascade="all,delete"
    )
