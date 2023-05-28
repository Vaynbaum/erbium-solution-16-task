from sqlalchemy import ForeignKey, Integer, Column, Boolean, DateTime
from sqlalchemy.orm import relationship

from database.base import Base
from database.models.basic_test_statuse import BasicTestStatuse
from database.models.selection_basic_test import SelectionBasicTest
from database.models.type_basic_test import TypeBasicTest


class BasicTest(Base):
    __tablename__ = "basic_tests"
    id = Column(Integer, primary_key=True)
    basic_test_status_id = Column(Integer(), ForeignKey("basic_test_statuses.id"))
    type_basic_test_id = Column(Integer(), ForeignKey("type_basic_tests.id"))
    passed = Column(Boolean, nullable=True)
    value = Column(Integer, nullable=True)
    begin = Column(DateTime, nullable=False)
    end = Column(DateTime, nullable=False)
    intern_id = Column(Integer, ForeignKey("interns.id"))
    type_basic_test = relationship(TypeBasicTest)
    basic_test_status = relationship(BasicTestStatuse)
    selections = relationship(
        SelectionBasicTest, backref="basic_test", cascade="all,delete"
    )
