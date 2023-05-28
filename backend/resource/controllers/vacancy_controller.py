from sqlalchemy.orm import Session
from database.models.condition import Condition
from database.models.duty import Duty
from database.models.requirement import Requirement
from database.models.skill import Skill
from database.models.skill_vacancy import SkillVacancy
from database.models.vacancy import Vacancy
from exceptions.user_exception import UserException
from models.message import MessageModel

from database.db_controller import DatabaseController
from database.models.organization import Organization
from models.organization import CreateOrganization
from models.vacancy import CreateVacancy


class VacancyController:
    def __init__(self):
        self.__database_controller = DatabaseController()

    def get_all_branchs(self, session: Session):
        return self.__database_controller.get_all_branchs(session)

    def get_all_training_directions(self, session: Session):
        return self.__database_controller.get_all_training_directions(session)

    def get_all_organizations(self, session: Session):
        return self.__database_controller.get_all_organizations(session)

    def get_all_work_experiences(self, session: Session):
        return self.__database_controller.get_all_work_experiences(session)

    def get_all_work_schedules(self, session: Session):
        return self.__database_controller.get_all_work_schedules(session)

    def get_all_employment_types(self, session: Session):
        return self.__database_controller.get_all_employment_types(session)

    def get_all_organization_types(self, session: Session):
        return self.__database_controller.get_all_organization_types(session)

    def get_by_id(self, session: Session, id: int):
        return self.__database_controller.get_vac_by_id(session, id)

    def get_all_metros(self, session: Session):
        return self.__database_controller.get_all_metros(session)

    def get_all_vacancies(
        self,
        to_intern: bool,
        work_experience_id: int | None,
        employment_type_ids: list[int] | None,
        work_schedule_ids: list[int] | None,
        branch_ids: list[int] | None,
        training_direction_ids: list[int] | None,
        organization_ids: list[int] | None,
        substr: str | None,
        salary: int | None,
        session: Session,
    ):
        return self.__database_controller.get_all_vacancies(
            to_intern,
            work_experience_id,
            employment_type_ids,
            work_schedule_ids,
            branch_ids,
            training_direction_ids,
            organization_ids,
            substr.title() if substr is not None else None,
            salary,
            session,
        )

    def get_all_full_organizations(
        self,
        organization_type_ids: list[int] | None,
        branch_ids: list[int] | None,
        training_direction_ids: list[int] | None,
        substr: str | None,
        score: int | None,
        session: Session,
    ):
        return self.__database_controller.get_all_full_organizations(
            organization_type_ids,
            branch_ids,
            training_direction_ids,
            substr.title() if substr is not None else None,
            score,
            session,
        )

    def post_create_organization(self, session: Session, org: CreateOrganization):
        try:
            organization = Organization(
                name=org.name,
                description=org.description,
                img=org.img,
                address=org.address,
                latitude=org.latitude,
                longitude=org.longitude,
                email=org.email,
                phone=org.phone,
                training_direction_id=org.training_direction_id,
                branch_id=org.branch_id,
                type_id=org.type_id,
            )
            if self.__database_controller.add_item(session, organization):
                return MessageModel(message="Организация добавлена")
        except Exception as e:
            return MessageModel(message="Организация не добавлена")

    def delete_vacancy(self, vacancy_id: int, session: Session):
        try:
            vac = self.__database_controller.get_vacancy_by_id(session, vacancy_id)
            session.delete(vac)
            session.commit()
            return MessageModel(message="Вакансия удалена")
        except Exception as e:
            raise UserException("Вакансия не удалена")

    def post_vacancy(self, session: Session, vacancy_cr: CreateVacancy):
        try:
            vacancy = Vacancy(
                name=vacancy_cr.name,
                description=vacancy_cr.description,
                min_salary=vacancy_cr.min_salary,
                max_salary=vacancy_cr.max_salary,
                date_begin=vacancy_cr.date_begin,
                date_end=vacancy_cr.date_end,
                published=False,
                work_schedule_id=vacancy_cr.work_schedule_id,
                organization_id=vacancy_cr.organization_id,
                employment_type_id=vacancy_cr.employment_type_id,
                hr_creater_id=vacancy_cr.hr_creater_id,
                work_experience_id=vacancy_cr.work_experience_id,
                cnt_intern=vacancy_cr.cnt_intern,
                status_id=1,
            )

            for c in vacancy_cr.conditions:
                vacancy.conditions.append(Condition(name=c))
            for r in vacancy_cr.requirements:
                vacancy.requirements.append(Requirement(name=r))
            for d in vacancy_cr.duties:
                vacancy.duties.append(Duty(name=d))
            for s in vacancy_cr.skills:
                skill = self.__database_controller.add_skill(session, Skill(name=s))
                vacancy.skills.append(SkillVacancy(skill=skill))
            if self.__database_controller.add_item(session, vacancy):
                return MessageModel(message="Вакансия добавлена")
        except Exception as e:
            raise UserException("Вакансия не добавлена")

    def change_status_vacancy(self, session: Session, vacancy_id: int, status_id: int):
        try:
            vacancy = session.query(Vacancy).get(vacancy_id)
            vacancy.status_id = status_id
            if status_id == 3:
                vacancy.published = True
            session.commit()
            return MessageModel(message="Статус вакансии изменен")
        except Exception as e:
            raise UserException("Статус вакансии не изменен")
