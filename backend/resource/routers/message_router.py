from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session

from common.dependencies import get_db
from controllers.message_controller import MessageController


router = APIRouter()
message_controller = MessageController()


@router.get("/my_notes")
async def get_my_notes(
    id: int,
    limit: int | None = None,
    session: Session = Depends(get_db),
):
    return message_controller.get_my_notes(id, limit, session)

@router.get("/cnt_not_read")
async def get_cnt_note_not_read(
    id: int,
    session: Session = Depends(get_db),
):
    return message_controller.get_cnt_note_not_read(id, session)

@router.get("/read_notes")
async def get_read_notes(
    id: int,
    limit: int | None = None,
    session: Session = Depends(get_db),
):
    return message_controller.get_read_notes(id, limit, session)
