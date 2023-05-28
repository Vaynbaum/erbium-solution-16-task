from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.response import Response
from models.response_status import PydanticResponseStatuseInDB
from models.selection import FullSelection


PydanticResponseInDB = sqlalchemy_to_pydantic(Response)


class FullResponse(PydanticResponseInDB):
    response_status: PydanticResponseStatuseInDB
    selection: FullSelection
    
