from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.training_direction import TrainingDirection


PydanticTrainingDirectionInDB = sqlalchemy_to_pydantic(TrainingDirection)

class TrainingDirectionToStatistic(PydanticTrainingDirectionInDB):
    cnt_intern: int | None