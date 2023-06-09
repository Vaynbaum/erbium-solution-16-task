from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from config import settings
from routers import const_router, message_router, vacancy_router, user_router


app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_URL,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(const_router.router, prefix="/const")
app.include_router(vacancy_router.router, prefix="/vacancy")
app.include_router(user_router.router, prefix="/user")
app.include_router(message_router.router, prefix="/msg")
