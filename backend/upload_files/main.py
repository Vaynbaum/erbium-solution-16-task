import datetime
from io import BytesIO
from fastapi import FastAPI, Query
from fastapi.security import HTTPBearer
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import StreamingResponse
from deta import Deta
import xlsxwriter

from config import settings
from routers import deta_router, local_router
from controllers.auth_controller import AuthController


app = FastAPI()
deta = Deta(settings.DETA_PROJECT_KEY)
security = HTTPBearer()
auth_controller = AuthController()


app.add_middleware(
    CORSMiddleware,
    allow_origins=settings.CORS_URL,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/excel_stats")
def upload_excel(
    vacancy: list[str] = Query(),
    intern: list[str] = Query(),
    date: list = Query(),
    hour: list = Query(),
    status: list[str] = Query(),
):
    output = BytesIO()
    workbook = xlsxwriter.Workbook(output)
    worksheet = workbook.add_worksheet()
    worksheet.write(0, 0, "Вакансия")
    worksheet.write(0, 1, "Стажер")
    worksheet.write(0, 2, "Кол-во часов")
    worksheet.write(0, 3, "Дата")
    worksheet.write(0, 4, "Статус")
    format2 = workbook.add_format({"num_format": "dd/mm/yyyy"})
    for i in range(len(vacancy)):
        worksheet.write(i + 1, 0, vacancy[i])
        worksheet.write(i + 1, 1, intern[i])
        worksheet.write(i + 1, 2, int(hour[i]))
        worksheet.write(
            i + 1, 3, datetime.datetime.strptime(date[i], "%Y-%m-%dT%H:%M:%S"), format2
        )
        worksheet.write(i + 1, 4, status[i])
    workbook.close()
    output.seek(0)

    headers = {
        "Content-Disposition": 'attachment; filename="statistic.xlsx"',
        "Access-Control-Expose-Headers": "Content-Disposition",
    }
    return StreamingResponse(output, headers=headers, media_type="application/xls")


app.include_router(local_router.router, prefix="/local")
app.include_router(deta_router.router)
