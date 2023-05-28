from sqlalchemy.orm import Session


from database.db_controller import DatabaseController


class ConstController:
    def __init__(self):
        self.__database_controller = DatabaseController()

    def get_all_citizenships(self, session: Session):
        return self.__database_controller.get_all_citizenships(session)

    def get_all_regions(self, session: Session):
        return self.__database_controller.get_all_regions(session)

    def get_all_cities(
        self, session: Session, begin_str: str | None, limit: int, region_id: int | None
    ):
        return self.__database_controller.get_all_cities(
            session, begin_str.title() if begin_str else None, limit, region_id
        )

    def get_all_directions(self, session: Session):
        return self.__database_controller.get_all_directions(session)

    def get_all_cources(self, session: Session):
        return self.__database_controller.get_all_cources(session)

    def get_all_universities(self, session: Session, city_id: int | None):
        return self.__database_controller.get_all_universities(session, city_id)

    def get_all_skills(self,session:Session):
        return self.__database_controller.get_all_skills(session)
