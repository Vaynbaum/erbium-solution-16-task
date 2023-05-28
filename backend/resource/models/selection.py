from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.selection import Selection
from models.intern import InternSelection
from models.stage import PydanticStageInDB
from models.vacancy import ShortVacancy


PydanticSelectionInDB = sqlalchemy_to_pydantic(Selection)


class ShortSelection(PydanticSelectionInDB):
    intern: InternSelection | None
    stage: PydanticStageInDB | None
    value: int | None


class FullSelection(PydanticSelectionInDB):
    vacancy: ShortVacancy
    stage: PydanticStageInDB | None
    intern: InternSelection | None
    school_val: int | None = None
    basic_val: int | None = None
