from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.recovery import Recovery
from models.user import PydanticUserInDB


PydanticRecovery = sqlalchemy_to_pydantic(Recovery)


class RecoveryWithUser(PydanticRecovery):
    user: PydanticUserInDB
