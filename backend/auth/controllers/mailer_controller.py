import requests
from common.phrases import SEND_FAILED

from config import settings


class MailerController:
    def send_url(self, email: str, url: str):
        try:
            result = requests.get(
                f"{settings.URL_MAILER}/reset_password", params={"email": email, "url": url}
            )
            print(result)
            if result.status_code != 200:
                print(SEND_FAILED)
            else:
                print(result.text)
            return result
        except Exception as e:
            print(e)

    def send_greeting(self, email: str, fullname: str):
        try:
            result = requests.get(
                f"{settings.URL_MAILER}/greeting",
                params={"email": email, "fullname": fullname},
            )
            print(result)
            if result.status_code != 200:
                print(SEND_FAILED)
            else:
                print(result.text)
            return result
        except Exception as e:
            print(e)

    def send_warn_signin(self, email: str):
        try:
            result = requests.get(
                f"{settings.URL_MAILER}/warning_signin", params={"email": email}
            )
            print(result)
            if result.status_code != 200:
                print(SEND_FAILED)
            else:
                print(result.text)
            return result
        except Exception as e:
            print(e)
