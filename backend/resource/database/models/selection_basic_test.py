from sqlalchemy import ForeignKey, Integer, Column

from database.base import Base


class SelectionBasicTest(Base):
    __tablename__ = "selection_basic_tests"
    basic_test_id = Column(Integer(), ForeignKey("basic_tests.id"), primary_key=True)
    selection_id = Column(Integer(), ForeignKey("selections.id"), primary_key=True)
