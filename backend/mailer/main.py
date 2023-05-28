from fastapi import FastAPI
from pydantic import EmailStr
from jinja2 import Template

from config import settings
from const import (
    FAILDED,
    SUBJECT_GREETING,
    SUBJECT_RECOVER_PASSWORD,
    SUBJECT_SIGNIN,
    SUCCSESS,
    INVITATION,
    MESSAGE
)
from message_model import MessageModel
from sender import createServer, post


serverSMTP = createServer(settings.EMAIL_SENDER, settings.PASSWORD)

app = FastAPI()


@app.get("/reset_password/")
async def root(email: EmailStr, url: str):
    html = open("./templates/reset_password.html", encoding="utf-8").read()
    template = Template(html)
    if serverSMTP is not None:
        res = post(
            serverSMTP,
            settings.EMAIL_SENDER,
            email,
            template.render(url=url),
            SUBJECT_RECOVER_PASSWORD,
            settings.PASSWORD,
        )
        return res if res else MessageModel(mailer_result=SUCCSESS)
    return MessageModel(mailer_result=FAILDED)


@app.get("/warning_signin/")
async def root(email: EmailStr):
    html = open("./templates/warning_signin.html", encoding="utf-8").read()
    template = Template(html)
    if serverSMTP is not None:
        res = post(
            serverSMTP,
            settings.EMAIL_SENDER,
            email,
            template.render(),
            SUBJECT_SIGNIN,
            settings.PASSWORD,
        )
        return res if res else MessageModel(mailer_result=SUCCSESS)
    return MessageModel(mailer_result=FAILDED)


@app.get("/greeting/")
async def root(email: EmailStr, name: str):
    html = open("./templates/greeting.html", encoding="utf-8").read()
    template = Template(html)
    if serverSMTP is not None:
        res = post(
            serverSMTP,
            settings.EMAIL_SENDER,
            email,
            template.render(name=name),
            SUBJECT_GREETING,
            settings.PASSWORD,
        )
        return res if res else MessageModel(mailer_result=SUCCSESS)
    return MessageModel(mailer_result=FAILDED)


@app.get("/inviting/")
async def root(email: EmailStr, url:str):
    html = open("./templates/invite_cur.html", encoding="utf-8").read()
    template = Template(html)
    if serverSMTP is not None:
        res = post(
            serverSMTP,
            settings.EMAIL_SENDER,
            email,
            template.render(url=url),
            INVITATION,
            settings.PASSWORD,
        )
        return res if res else MessageModel(mailer_result=SUCCSESS)
    return MessageModel(mailer_result=FAILDED)

@app.get("/any_message/")
async def root(email: EmailStr, message:str):
    html = open("./templates/any_message.html", encoding="utf-8").read()
    template = Template(html)
    if serverSMTP is not None:
        res = post(
            serverSMTP,
            settings.EMAIL_SENDER,
            email,
            template.render(message=message),
            MESSAGE,
            settings.PASSWORD,
        )
        return res if res else MessageModel(mailer_result=SUCCSESS)
    return MessageModel(mailer_result=FAILDED)