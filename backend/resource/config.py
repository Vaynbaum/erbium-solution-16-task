from typing import List
from pydantic import BaseSettings


class Settings(BaseSettings):
    POSTGRES_USER: str
    POSTGRES_PASSWORD: str
    POSTGRES_DB: str
    HOST:str
    PORT: str
    SECRET_STRING: str
    ALGORITHM: str
    URL_MAILER: str
    URL_INV: str
    CORS_URL: List[str]

    class Config:
        env_file = ".env"


settings = Settings()
