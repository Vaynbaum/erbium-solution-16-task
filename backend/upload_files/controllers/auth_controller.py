from jose import jwt

from common.consts import (
    ACCESS_TOKEN,
    PAYLOAD_NAME_SUB_ID,
    PAYLOAD_NAME_SUB_ROLE_ID,
    PAYLOAD_NAME_SCOPE,
)

from common.phrases import INVALID_TOKEN, SCOPE_TOKEN_INVALID, TOKEN_EXPIRED
from config import settings
from exceptions.token_exception import TokenException


class AuthController:
    def decode_token(self, token: str) -> str:
        try:
            payload = jwt.decode(
                token, settings.SECRET_STRING, algorithms=[settings.ALGORITHM]
            )
            if payload[PAYLOAD_NAME_SCOPE] == ACCESS_TOKEN:
                return payload[PAYLOAD_NAME_SUB_ID], payload[PAYLOAD_NAME_SUB_ROLE_ID]
            raise TokenException(SCOPE_TOKEN_INVALID)
        except jwt.ExpiredSignatureError:
            raise TokenException(TOKEN_EXPIRED)
        except jwt.InvalidTokenError:
            raise TokenException(INVALID_TOKEN)
