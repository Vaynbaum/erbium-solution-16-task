from sqlalchemy.orm import Session


from database.db_controller import DatabaseController


class MessageController:
    def __init__(self):
        self.__database_controller = DatabaseController()

    def get_my_notes(self, user_id: int, limit: int | None, session: Session):
        return self.__database_controller.get_my_notes(session, user_id, limit)

    def get_cnt_note_not_read(self, user_id: int, session: Session):
        return self.__database_controller.get_cnt_note_not_read(session, user_id)
    
    def get_read_notes(self, user_id: int, limit: int | None, session: Session):
        notes = self.__database_controller.get_my_notes(session, user_id, limit)
        for n in notes:
            n.is_readed = True
        self.__database_controller.add_notes(session, notes)
