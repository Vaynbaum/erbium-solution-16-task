from fastapi import APIRouter, Depends, HTTPException, Query, status
from fastapi.security import HTTPBearer
from sqlalchemy.orm import Session

from common.dependencies import get_db
from controllers.vacancy_controller import VacancyController
from exceptions.user_exception import UserException
from models.branch import PydanticBranchInDB
from models.employment_type import PydanticEmploymentTypeInDB
from models.organization import (
    CreateOrganization,
    OrganizationWithTrainingDirection,
    PydanticOrganizationInDB,
)
from models.organization_type import PydanticOrganizationTypeInDB
from models.training_direction import PydanticTrainingDirectionInDB
from models.vacancy import CreateVacancy, FullVacancy
from models.work_experience import PydanticWorkExperienceInDB
from models.work_schedule import PydanticWorkScheduleInDB
from models.metro import PydanticMetroInDB

security = HTTPBearer()
router = APIRouter(tags=["Vacancy"])
vacancy_controller = VacancyController()


@router.get(
    "/get_all_branchs",
    responses={
        200: {"model": list[PydanticBranchInDB]},
    },
)
async def get_all_branchs(
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_branchs(session)


@router.get(
    "/get_all_training_directions",
    responses={
        200: {"model": list[PydanticTrainingDirectionInDB]},
    },
)
async def get_all_training_directions(
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_training_directions(session)


@router.get(
    "/get_all_organizations",
    responses={
        200: {"model": list[PydanticOrganizationInDB]},
    },
)
async def get_all_organizations(
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_organizations(session)


@router.get(
    "/get_all_work_experiences",
    responses={
        200: {"model": list[PydanticWorkExperienceInDB]},
    },
)
async def get_all_work_experiences(
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_work_experiences(session)


@router.get(
    "/get_all_work_schedules",
    responses={
        200: {"model": list[PydanticWorkScheduleInDB]},
    },
)
async def get_all_work_schedules(
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_work_schedules(session)


@router.get(
    "/get_all_employment_types",
    responses={
        200: {"model": list[PydanticEmploymentTypeInDB]},
    },
)
async def get_all_employment_types(
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_employment_types(session)


@router.get(
    "/get_all_vacancies",
    responses={
        200: {"model": list[FullVacancy]},
    },
)
async def get_all_vacancies(
    to_intern: bool = True,
    work_experience_id: int | None = Query(default=None),
    employment_type_ids: list[int] | None = Query(default=None),
    work_schedule_ids: list[int] | None = Query(default=None),
    branch_ids: list[int] | None = Query(default=None),
    training_direction_ids: list[int] | None = Query(default=None),
    organization_ids: list[int] | None = Query(default=None),
    substr: str | None = Query(default=None),
    salary: int | None = Query(default=None),
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_vacancies(
        to_intern,
        work_experience_id,
        employment_type_ids,
        work_schedule_ids,
        branch_ids,
        training_direction_ids,
        organization_ids,
        substr,
        salary,
        session,
    )


@router.get(
    "/get_all_organization_types",
    responses={
        200: {"model": list[PydanticOrganizationTypeInDB]},
    },
)
async def get_all_organization_types(
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_organization_types(session)


@router.get(
    "/get_all_metros",
    responses={
        200: {"model": list[PydanticMetroInDB]},
    },
)
async def get_all_metros(session: Session = Depends(get_db)):
    return vacancy_controller.get_all_metros(session)


@router.get("/get_by_id")
async def get_by_id(id: int, session: Session = Depends(get_db)):
    return vacancy_controller.get_by_id(session, id)


@router.get(
    "/get_all_full_organizations",
    responses={
        200: {"model": list[OrganizationWithTrainingDirection]},
    },
)
async def get_all_full_organizations(
    organization_type_ids: list[int] | None = Query(default=None),
    branch_ids: list[int] | None = Query(default=None),
    training_direction_ids: list[int] | None = Query(default=None),
    substr: str | None = Query(default=None),
    score: int | None = Query(default=None),
    session: Session = Depends(get_db),
):
    return vacancy_controller.get_all_full_organizations(
        organization_type_ids,
        branch_ids,
        training_direction_ids,
        substr,
        score,
        session,
    )


@router.post("/create_organization")
async def post_create_organization(
    organization: CreateOrganization,
    session: Session = Depends(get_db),
):
    return vacancy_controller.post_create_organization(session, organization)


@router.post("/vacancy")
async def post_vacancy(
    vacancy: CreateVacancy,
    session: Session = Depends(get_db),
):
    try:
        return vacancy_controller.post_vacancy(session, vacancy)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.delete("/vacancy")
async def delete_vacancy(
    vacancy_id: int,
    session: Session = Depends(get_db),
):
    try:
        return vacancy_controller.delete_vacancy(vacancy_id, session)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/change_status_vacancy")
async def change_status_vacancy(
    vacancy_id: int,
    status_id: int,
    session: Session = Depends(get_db),
):
    try:
        return vacancy_controller.change_status_vacancy(session, vacancy_id, status_id)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)
