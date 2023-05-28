from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.branch import Branch



PydanticBranchInDB = sqlalchemy_to_pydantic(Branch)
