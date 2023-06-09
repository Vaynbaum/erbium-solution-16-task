import random
import string
from fastapi import (
    APIRouter,
    File,
    HTTPException,
    Response,
    Security,
    UploadFile,
    status,
)
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from fastapi.responses import StreamingResponse
from deta import Deta

from config import settings
from controllers.auth_controller import AuthController
from exceptions.token_exception import TokenException
from common.consts import generate_img_name_by_key, generate_file_name_by_key


security = HTTPBearer()
deta = Deta(settings.DETA_PROJECT_KEY)
router = APIRouter(tags=["Deta"])
auth_controller = AuthController()
drive = deta.Drive(settings.DETA_NAME_DRIVE)


@router.delete("/")
def delete_img(
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    try:
        id, role_id = auth_controller.decode_token(credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    return drive.delete(generate_img_name_by_key(id))


@router.post("/")
def upload_img(
    portfolio: bool = False,
    file: UploadFile = File(...),
    filename: str | None = None,
    name_type: str | None = None,
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    try:
        id, role_id = auth_controller.decode_token(credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    if portfolio:
        res = drive.put(generate_file_name_by_key(id, filename), file.file)
        return f"{random.choice(string.ascii_letters)}/{res}"
    elif name_type:
        let = random.choice(string.ascii_letters)
        long = generate_file_name_by_key(id, filename, name_type)
        res = drive.put(f"{let}_{long}", file.file)
        return res
    else:
        res = drive.put(
            filename if filename else generate_img_name_by_key(id), file.file
        )
        return f"{random.choice(string.ascii_letters)}/{res}"


@router.get("/{symbol}/{name}")
def download_img(symbol: str, name: str, type: str | None = None):
    data = drive.get(name)
    if data:
        media_type = type if type else f'application/{name.split(".")[-1]}'
        if media_type != "application/jpg":
            return Response(content=data.read(), media_type=media_type)
        return StreamingResponse(data.iter_chunks(2048), media_type="image/jpg")
    return None
