from fastapi import BackgroundTasks, Depends, HTTPException, Security, status, APIRouter
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer

from sqlalchemy.orm import Session

from common.dependencies import get_db
from config import settings
from controllers.user_controller import UserController
from exceptions.token_exception import TokenException
from exceptions.user_exception import UserException
from models.intern import UpdateInternModel
from models.presence import CreatePresence
from models.school import UpdateScholl
from models.task import CreateTask
from models.user import FullUser, UpdateUserModel
from models.base_test import UpdateTest
from models.vacancy import CreateVacancy

security = HTTPBearer()
router = APIRouter(tags=["User"])
user_controller = UserController()


@router.get("/my", responses={200: {"model": FullUser}})
async def get_my_profile(
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_my_profile(session, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.delete("/skill")
async def delete_my_skill(
    skill_id: int,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.delete_my_skill(
            session, skill_id, credentials.credentials
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/add_skill")
async def get_add_skill(
    skill_id: int | None = None,
    skill_name: str | None = None,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_add_skill(
            session, skill_id, skill_name, credentials.credentials
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.put("/update_user")
async def put_update_user(
    user: UpdateUserModel,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.put_update_user(session, user, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.put("/update_intern")
async def put_update_intern(
    user: UpdateInternModel,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.put_update_intern(session, user, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/verified_user")
async def verified_user(
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.verified_user(session, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.delete("/profile")
async def delete_profile(
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.delete_profile(session, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.put("/change_base_test")
async def change_base_test(
    test: UpdateTest,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.change_base_test(session, credentials.credentials, test)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/rating")
async def get_rating_intern(
    to_mentor: bool = False,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_rating_intern(
            session, credentials.credentials, to_mentor
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/change_img")
async def change_img(
    img: str,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.change_img(session, credentials.credentials, img)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/change_portfolio")
async def change_portfolio(
    portfolio: str,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.change_portfolio(
            session, credentials.credentials, portfolio
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/response")
async def put_response(
    vacancy_id: int,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.put_response(
            session, credentials.credentials, vacancy_id
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.delete("/selection")
async def delete_my_selection(
    selection_id: int,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.delete_my_selection(
            session, selection_id, credentials.credentials
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/responses")
async def get_my_responses(
    to_curator: bool = False,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_my_responses(
            session, credentials.credentials, to_curator
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/my_school")
async def get_my_school(
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_my_school(session, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/base_tests")
async def get_my_base_tests(
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_my_base_tests(session, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/status_responses")
async def get_status_responses(session: Session = Depends(get_db)):
    return user_controller.get_status_responses(session)


@router.get("/change_response")
async def get_change_response(
    response_id: int,
    status_id: int,
    background_tasks: BackgroundTasks,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_change_response(
            session, response_id, status_id, credentials.credentials, background_tasks
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.put("/change_school")
async def change_school(
    school: UpdateScholl,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.change_school(session, credentials.credentials, school)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/selections_to_mentor")
async def get_selections_to_mentor(
    organization_id: int,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_selections_to_mentor(
            session, credentials.credentials, organization_id
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/change_selection")
async def get_change_selection(
    selection_id: int,
    stage_id: int,
    background_tasks: BackgroundTasks,
    credentials: HTTPAuthorizationCredentials = Security(security),
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_change_selection(
            session, credentials.credentials, selection_id, stage_id, background_tasks
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/interns")
async def get_interns(
    mentors: bool = False,
    session: Session = Depends(get_db),
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    try:
        return user_controller.get_interns(session, credentials.credentials, mentors)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.post("/task_interview")
async def post_task_interview(
    task: CreateTask,
    session: Session = Depends(get_db),
):
    return user_controller.post_task_interview(session, task)


@router.get("/to_statistic")
async def get_to_statistic(
    session: Session = Depends(get_db),
):
    return user_controller.get_to_statistic(session)


@router.get("/cnt_all_interns_by_work_experiens")
async def get_cnt_all_interns_by_work_experiens(
    session: Session = Depends(get_db),
):
    return user_controller.get_cnt_all_interns_by_work_experiens(session)


@router.get("/cnt_all_interns_by_university")
async def get_cnt_all_interns_by_university(
    session: Session = Depends(get_db),
):
    return user_controller.get_cnt_all_interns_by_university(session)


@router.get("/cnt_all_interns_by_direction")
async def get_cnt_all_interns_by_direction(
    session: Session = Depends(get_db),
):
    return user_controller.get_cnt_all_interns_by_direction(session)


@router.get("/result_interview")
async def get_result_interview(
    organization_id: int,
    session: Session = Depends(get_db),
):
    return user_controller.get_result_interview(session, organization_id)


@router.post("/add_presence")
async def post_add_presence(
    presence: CreatePresence,
    session: Session = Depends(get_db),
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    try:
        return user_controller.post_add_presence(
            session, credentials.credentials, presence
        )
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/my_presence")
async def get_my_presence(
    session: Session = Depends(get_db),
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    try:
        return user_controller.get_my_presence(session, credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    except UserException as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=e.message)


@router.get("/invitation")
async def get_invitation(
    email: str,
    role_id: int,
    background_tasks: BackgroundTasks,
    session: Session = Depends(get_db),
):
    try:
        return user_controller.get_invitation(session, email, role_id, background_tasks)
    except UserException as e:
        raise HTTPException(status_code=400, detail=e.message)
