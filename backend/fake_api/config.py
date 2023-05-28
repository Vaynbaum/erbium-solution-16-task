from typing import List
from pydantic import BaseSettings


class Settings(BaseSettings):
    URL: str
    CORS_URL: List[str]

    class Config:
        env_file = ".env"


settings = Settings()
