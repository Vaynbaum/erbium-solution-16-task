from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.mentor import Mentor
from models.organization import ShortOrganization


PydanticMentorInDB = sqlalchemy_to_pydantic(Mentor)


class FullMentor(PydanticMentorInDB):
    organization: ShortOrganization | None
