from typing import List
from pydantic import BaseSettings


class Settings(BaseSettings):
    DB_USER: str
    DB_PASSWORD: str
    DB_NAME: str
    DB_HOST:str
    DB_PORT: str
    SECRET_STRING: str
    ALGORITHM: str
    URL_MAILER: str
    URL_INV: str
    CORS_URL: List[str]

    class Config:
        env_file = ".env"


settings = Settings()
