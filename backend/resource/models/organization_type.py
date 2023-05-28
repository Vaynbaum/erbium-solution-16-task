from pydantic_sqlalchemy import sqlalchemy_to_pydantic

from database.models.organization_type import OrganizationType




PydanticOrganizationTypeInDB = sqlalchemy_to_pydantic(OrganizationType)
