from pydantic import BaseModel


class CreateTask(BaseModel):
    vacancy_id: int
    training_direction_id: int
    mentor_id: int
    url_task: str 
