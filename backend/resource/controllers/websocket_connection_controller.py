from fastapi import WebSocket


class ConnectionManager:
    def __init__(self):
        self.__active_connections: dict[str, WebSocket] = {}

    async def connect(self, websocket: WebSocket, id: int):
        if id:
            await websocket.accept()
            if id not in self.__active_connections:
                self.__active_connections[id] = websocket

    def disconnect(self, id: int):
        if id in self.__active_connections:
            s = self.__active_connections.pop(id)
            s.close()

    async def send_personal_message(self, message, id: int):
        if id in self.__active_connections:
            await self.__active_connections[id].send_json(message)

    async def broadcast(self, message: str):
        for connection in self.__active_connections.values():
            await connection.send_text(message)
