import random
from fastapi.middleware.cors import CORSMiddleware
from fastapi import FastAPI
from jinja2 import Template
from fastapi.responses import HTMLResponse
from config import settings

app = FastAPI()
app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_URL,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/fake_test_page/")
async def root(test_name: str, status: str, value: int):
    html = open("./templates/fake_test_page.html", encoding="utf-8").read()
    template = Template(html)
    return HTMLResponse(
        content=template.render(test_name=test_name, value=value, status=status),
        status_code=200,
    )


@app.get("/fake_scholl_page/")
async def root():
    html = open("./templates/fake_school_page.html", encoding="utf-8").read()
    template = Template(html)
    return HTMLResponse(
        content=template.render(
            vebinars=[{"name": f"Вебинар {i}", "id": i} for i in range(1, 6)]
        ),
        status_code=200,
    )


@app.get("/fake_scholl/")
async def root():
    return {"url": f"{settings.URL}/fake_scholl_page", "value": 50, "passed": True}


@app.get("/fake_test/")
async def root(test_name: str, test_id: int):
    value = random.randint(40, 100)
    passed = value >= 60
    return {
        "url": f"{settings.URL}/fake_test_page?test_name={test_name}&value={value}&status={'прошли' if value > 60 else 'не прошли'}",
        "value": value,
        "passed": passed,
        "status_id": 2 if passed else 3,
    }
