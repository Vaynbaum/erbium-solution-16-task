import json
import random
import string
from fastapi import FastAPI, File, HTTPException, Response, Security, UploadFile, status
from fastapi.security import HTTPAuthorizationCredentials, HTTPBearer


from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse
from deta import Deta
import requests

from config import settings
from controllers.auth_controller import AuthController
from exceptions.token_exception import TokenException

app = FastAPI()
deta = Deta(settings.DETA_PROJECT_KEY)
drive = deta.Drive(settings.DETA_NAME_DRIVE)
security = HTTPBearer()
auth_controller = AuthController()


def generate_img_name_by_key(id: int):
    return f"{id}.jpg"


def generate_file_name_by_key(id: int, filename: str, filtype: str = "portfolio"):
    return f"{id}_{filtype}.{filename.split('.')[-1]}"


app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_URL,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.delete("/")
def delete_img(
    credentials: HTTPAuthorizationCredentials = Security(security),
):
    try:
        id, role_id = auth_controller.decode_token(credentials.credentials)
    except TokenException as e:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail=e.message)
    return drive.delete(generate_img_name_by_key(id))


@app.post("/")
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


@app.get("/{symbol}/{name}")
def download_img(symbol: str, name: str, type: str | None = None):
    data = drive.get(name)
    if data:
        if type:
            return Response(content=data.read(), media_type=type)
        return StreamingResponse(data.iter_chunks(2048), media_type="image/jpg")
    return None


@app.get("/pdf_resume")
def upload_pdf():
    api_key = "df68MTI4ODE6OTkzNzpST2pxdEVmZlgyTFlOZHN"
    template_id = "e9877b238ce65474"
    data = {
        "message": "The greatest glory in living lies not in never falling",
        "author": "Nelson Mandela",
    }
    response = requests.post(
        f"https://api.apitemplate.io/v1/create?template_id={template_id}",
        headers={"X-API-KEY": f"{api_key}"},
        json=data,
    )
    return json.loads(response.text)
