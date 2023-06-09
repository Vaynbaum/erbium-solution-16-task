from pydantic import BaseModel


class CreateInterview(BaseModel):
    text: str
    mark: int
    mentor_id: int
    organization_id: int
