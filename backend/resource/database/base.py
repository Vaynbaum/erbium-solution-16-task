from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from config import settings


def init():
    db_url = f"postgresql://{settings.POSTGRES_USER}:{settings.POSTGRES_PASSWORD}@{settings.HOST}/{settings.POSTGRES_DB}"
    engine = create_engine(db_url)
    session_local = sessionmaker(autoflush=False, bind=engine)
    return engine, session_local


Base = declarative_base()
Engine, SessionLocal = init()
