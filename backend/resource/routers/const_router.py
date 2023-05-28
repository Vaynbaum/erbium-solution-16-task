from fastapi import APIRouter, Depends
from fastapi.security import HTTPBearer
from sqlalchemy.orm import Session

from common.dependencies import get_db
from controllers.const_controller import ConstController
from models.citizenship import PydanticCitizenshipInDB
from models.city import CityWithRegionInDB
from models.cource import PydanticCourseInDB
from models.direction import PydanticDirectionInDB
from models.region import PydanticRegionInDB
from models.university import PydanticUniversityInDB
from models.skill import PydanticSkillInDB

security = HTTPBearer()
router = APIRouter(tags=["Const"])
const_controller = ConstController()


@router.get("/get_all_citizenships", response_model=list[PydanticCitizenshipInDB])
async def get_all_citizenships(
    session: Session = Depends(get_db),
):
    return const_controller.get_all_citizenships(session)


@router.get("/get_all_regions", response_model=list[PydanticRegionInDB])
async def get_all_regions(
    session: Session = Depends(get_db),
):
    return const_controller.get_all_regions(session)


@router.get("/get_all_cities", response_model=list[CityWithRegionInDB])
async def get_all_cities(
    begin_str: str | None = None,
    limit: int = 20,
    session: Session = Depends(get_db),
    region_id: int | None = None,
):
    return const_controller.get_all_cities(session, begin_str, limit, region_id)


@router.get("/get_all_directions", response_model=list[PydanticDirectionInDB])
async def get_all_directions(session: Session = Depends(get_db)):
    return const_controller.get_all_directions(session)


@router.get("/get_all_courses", response_model=list[PydanticCourseInDB])
async def get_all_cources(session: Session = Depends(get_db)):
    return const_controller.get_all_cources(session)


@router.get("/get_all_universities", response_model=list[PydanticUniversityInDB])
async def get_all_universities(
    session: Session = Depends(get_db), city_id: int | None = None
):
    return const_controller.get_all_universities(session, city_id)


@router.get("/get_all_skills", response_model=list[PydanticSkillInDB])
async def get_all_skills(session: Session = Depends(get_db)):
    return const_controller.get_all_skills(session)  