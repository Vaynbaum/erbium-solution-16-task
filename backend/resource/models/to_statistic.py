from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.training_direction import TrainingDirection

ToStatisticInDB = sqlalchemy_to_pydantic(TrainingDirection)


class FullToStatistic(ToStatisticInDB):
    cnt_vacancy: int | None
    cnt_response: int | None
    cnt_not_recs: int | None
    cnt_suc: int | None