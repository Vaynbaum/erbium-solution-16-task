from pydantic import BaseModel
from pydantic_sqlalchemy import sqlalchemy_to_pydantic
from database.models.organization import Organization
from models.branch import PydanticBranchInDB
from models.training_direction import PydanticTrainingDirectionInDB


PydanticOrganizationInDB = sqlalchemy_to_pydantic(Organization)


class ShortOrganization(PydanticOrganizationInDB):
    training_direction: PydanticTrainingDirectionInDB
    branch: PydanticBranchInDB

class OrganizationWithTrainingDirection(ShortOrganization):
    review_count: int | None = None
    average_score: float | None = None
    number_mentor: int | None = None
    number_vacancy: int | None = None


class CreateOrganization(BaseModel):
    name: str
    branch_id: int
    type_id: int
    description: str
    img: str | None = None
    latitude: float
    longitude: float
    address: str
    training_direction_id: int
    phone: str
    email: str
