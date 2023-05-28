import fastapi, uvicorn, Model
from pydantic import BaseModel
from fastapi.middleware.cors import CORSMiddleware

from config import settings


class packet(BaseModel):
    text: str


model = Model.NLPrecom(model_name="model")

app = fastapi.FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_URL,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/", status_code=200)
def checker():
    return "NeuralNet is working"


@app.post(
    "/tag",
    summary="Take json {text:'some_txt'} "
    "and send result {tag: ['tag1'"
    ",'tag2', ...]}",
    status_code=200,
)
def tager(target: packet):
    result = model.predict_tag(target.text)
    return {"tag": result}


if __name__ == "__main__":
    uvicorn.run(app, host="127.0.0.1", port=8005)
