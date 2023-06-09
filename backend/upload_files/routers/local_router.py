import os
import random
import string
from fastapi import APIRouter, File, HTTPException, Security, UploadFile, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer
from fastapi.responses import FileResponse
from PIL import Image

from controllers.auth_controller import AuthController
from exceptions.token_exception import TokenException
from common.consts import generate_img_name_by_key, generate_file_name_by_key, NAME_DIR

security = HTTPBearer()
router = APIRouter(tags=["Local"])
auth_controller = AuthController()

NAME_DIR = "public"


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
        f_n = generate_file_name_by_key(id, filename)
        f_n = f"{random.choice(string.ascii_letters)}_{f_n}"
        file_location = f"{NAME_DIR}/{f_n}"
        try:
            contents = file.file.read()
            with open(file_location, 'wb') as f:
                f.write(contents)
        except Exception as e:
            print(e)
        finally:
            file.file.close()
        return f_n
    elif name_type:
        let = random.choice(string.ascii_letters)
        long = generate_file_name_by_key(id, filename, name_type)
        long = f"{let}_{long}"
        file_location = f"{NAME_DIR}/{long}"
        try:
            contents = file.file.read()
            with open(file_location, 'wb') as f:
                f.write(contents)
        except Exception as e:
            print(e)
        finally:
            file.file.close()
        return long
    else:
        f_n = filename if filename else generate_img_name_by_key(id)
        f_n = f"{random.choice(string.ascii_letters)}_{f_n}"
        file_location = f"{NAME_DIR}/{f_n}"
        img_pil = Image.open(file.file)
        img_pil.save(file_location)
        return f_n


@router.get("/dir")
def audio():
    return os.listdir(NAME_DIR)


@router.get("/{filename}", status_code=200)
def audio(filename: str):
    return FileResponse(f"{NAME_DIR}/{filename}")
