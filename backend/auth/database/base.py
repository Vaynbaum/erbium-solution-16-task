from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from config import settings


def init():
    db_url = f"postgresql://{settings.DB_USER}:{settings.DB_PASSWORD}@{settings.DB_HOST}/{settings.DB_NAME}"
    engine = create_engine(db_url)
    session_local = sessionmaker(autoflush=False, bind=engine)
    return engine, session_local


Base = declarative_base()
Engine, SessionLocal = init()
