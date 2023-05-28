from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.hr import HR
from models.organization import ShortOrganization


PydanticHRInDB = sqlalchemy_to_pydantic(HR)


class FullHR(PydanticHRInDB):
    organization: ShortOrganization | None
