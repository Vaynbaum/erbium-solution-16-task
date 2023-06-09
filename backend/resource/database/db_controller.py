from sqlalchemy.orm import Session, subqueryload
from sqlalchemy import func
from database.base import Base, Engine
from sqlalchemy import or_


from database.models.branch import Branch
from database.models.basic_test import BasicTest
from database.models.basic_test_statuse import BasicTestStatuse
from database.models.citizenship import Citizenship
from database.models.championship import Championship
from database.models.city import City
from database.models.condition import Condition
from database.models.presence import Presence
from database.models.course import Course
from database.models.curator import Curator
from database.models.invation import Invation
from database.models.direction import Direction
from database.models.duty import Duty
from database.models.employment_type import EmploymentType
from database.models.event import Event
from database.models.history_work_experience import HistoryWorkExperience
from database.models.hr import HR
from database.models.selection_basic_test import SelectionBasicTest
from database.models.intern import Intern
from database.models.internship_status import InternshipStatus
from database.models.interview import Interview
from database.models.language import Language
from database.models.language_intern import LanguageIntern
from database.models.mentor import Mentor
from database.models.metro import Metro
from database.models.mentor_review import MentorReview
from database.models.organization_review import OrganizationReview
from database.models.organization_type import OrganizationType
from database.models.organization import Organization
from database.models.task import Task
from database.models.permission import Permission
from database.models.recovery import Recovery
from database.models.vacancy_status import VacancyStatus
from database.models.region import Region
from database.models.requirement import Requirement
from database.models.response_statuse import ResponseStatuse
from database.models.response import Response
from database.models.role import Role
from database.models.note import Note
from database.models.scholl import Scholl
from database.models.selection import Selection
from database.models.skill_intern import SkillIntern
from database.models.skill_vacancy import SkillVacancy
from database.models.skill import Skill
from database.models.speaker import Speaker
from database.models.stage import Stage
from database.models.training_direction import TrainingDirection
from database.models.type_basic_test import TypeBasicTest
from database.models.type_interview import TypeInterview
from database.models.university import University
from database.models.user import User
from database.models.vacancy_review import VacancyReview
from database.models.vacancy import Vacancy
from database.models.work_experience import WorkExperience
from database.models.work_schedule import WorkSchedule
from models.base_test import FullBasicTest


from models.branch import PydanticBranchInDB
from models.citizenship import PydanticCitizenshipInDB
from models.city import CityWithRegionInDB
from models.cource import PydanticCourseInDB
from models.direction import PydanticDirectionInDB
from models.employment_type import PydanticEmploymentTypeInDB
from models.intern import FullIntern, InternSelection
from models.metro import PydanticMetroInDB
from models.organization import (
    OrganizationWithTrainingDirection,
    PydanticOrganizationInDB,
)
from models.organization_type import PydanticOrganizationTypeInDB
from models.region import PydanticRegionInDB
from models.response import FullResponse
from models.response_status import PydanticResponseStatuseInDB
from models.school import PydanticSchollInDB
from models.selection import FullSelection, ShortSelection
from models.skill import PydanticSkillInDB
from models.to_statistic import FullToStatistic
from models.training_direction import (
    PydanticTrainingDirectionInDB,
    TrainingDirectionToStatistic,
)
from models.university import PydanticUniversityInDB, UniversityToStatistic
from models.user import FullUser, UserWithRoleInDB
from models.vacancy import FullVacancy
from models.work_experience import PydanticWorkExperienceInDB, WorkExperienceToStatistic
from models.work_schedule import PydanticWorkScheduleInDB


class DatabaseController:
    def __init__(self) -> None:
        Base.metadata.create_all(Engine)

    def get_all_citizenships(self, session: Session):
        citizenships = session.query(Citizenship).order_by(Citizenship.name).all()
        return [PydanticCitizenshipInDB.from_orm(c) for c in citizenships]

    def get_all_regions(self, session: Session):
        regions = session.query(Region).order_by(Region.name).all()
        return [PydanticRegionInDB.from_orm(r) for r in regions]

    def get_all_cities(
        self, session: Session, begin_str: str | None, limit: int, region_id: int | None
    ):
        query = session.query(City).options(subqueryload(City.region))
        if region_id:
            query = query.filter(City.region_id == region_id)
        if begin_str is not None:
            query = query.filter(City.name.like(f"{begin_str}%"))
        cities = query.order_by(City.name).limit(limit).all()
        return [CityWithRegionInDB.from_orm(c) for c in cities]

    def get_all_directions(self, session: Session):
        directions = session.query(Direction).order_by(Direction.name).all()
        return [PydanticDirectionInDB.from_orm(d) for d in directions]

    def get_all_cources(self, session: Session):
        cources = session.query(Course).all()
        return [PydanticCourseInDB.from_orm(c) for c in cources]

    def get_all_metros(self, session: Session):
        metros = session.query(Metro).all()
        return [PydanticMetroInDB.from_orm(m) for m in metros]

    def get_all_universities(self, session: Session, city_id: int | None):
        query = session.query(University)
        if city_id:
            query1 = query.filter(University.city_id == city_id)
            query1 = query1.order_by(University.city_id, University.name)
            query2 = query.filter(University.city_id != city_id)
            query2 = query2.order_by(University.city_id, University.name)

            universities = query1.union(query2).all()

        else:
            universities = query.order_by(University.city_id, University.name).all()
        return [PydanticUniversityInDB.from_orm(u) for u in universities]

    def get_all_branchs(self, session: Session):
        branchs = session.query(Branch).order_by(Branch.name).all()
        return [PydanticBranchInDB.from_orm(b) for b in branchs]

    def get_all_training_directions(self, session: Session):
        training_directions = session.query(TrainingDirection).all()
        return [PydanticTrainingDirectionInDB.from_orm(t) for t in training_directions]

    def get_all_organizations(self, session: Session):
        organizations = session.query(Organization).order_by(Organization.name).all()
        return [PydanticOrganizationInDB.from_orm(o) for o in organizations]

    def get_all_work_experiences(self, session: Session):
        work_experiences = session.query(WorkExperience).all()
        return [PydanticWorkExperienceInDB.from_orm(w) for w in work_experiences]

    def get_all_work_schedules(self, session: Session):
        work_schedules = session.query(WorkSchedule).all()
        return [PydanticWorkScheduleInDB.from_orm(w) for w in work_schedules]

    def get_all_employment_types(self, session: Session):
        employment_types = session.query(EmploymentType).all()
        return [PydanticEmploymentTypeInDB.from_orm(e) for e in employment_types]

    def get_all_organization_types(self, session: Session):
        organization_types = session.query(OrganizationType).all()
        return [PydanticOrganizationTypeInDB.from_orm(o) for o in organization_types]

    def get_vac_by_id(self, session: Session, id: int):
        vac = (
            session.query(Vacancy)
            .options(
                subqueryload(Vacancy.requirements),
                subqueryload(Vacancy.conditions),
                subqueryload(Vacancy.duties),
                subqueryload(Vacancy.work_experience),
                subqueryload(Vacancy.employment_type),
                subqueryload(Vacancy.work_schedule),
                subqueryload(Vacancy.organization).subqueryload(
                    Organization.training_direction
                ),
                subqueryload(Vacancy.organization).subqueryload(Organization.branch),
                subqueryload(Vacancy.skills).subqueryload(SkillVacancy.skill),
            )
            .get(id)
        )
        return FullVacancy.from_orm(vac)

    def get_all_skills(self, session: Session):
        skills = session.query(Skill).order_by(Skill.name).all()
        return [PydanticSkillInDB.from_orm(s) for s in skills]

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
        query = session.query(Vacancy).options(
            subqueryload(Vacancy.requirements),
            subqueryload(Vacancy.conditions),
            subqueryload(Vacancy.duties),
            subqueryload(Vacancy.work_experience),
            subqueryload(Vacancy.employment_type),
            subqueryload(Vacancy.work_schedule),
            subqueryload(Vacancy.organization).subqueryload(
                Organization.training_direction
            ),
            subqueryload(Vacancy.skills).subqueryload(SkillVacancy.skill),
        )
        if to_intern:
            query = query.filter(Vacancy.published == True)
        if work_experience_id:
            query = query.filter(Vacancy.work_experience_id == work_experience_id)
        if substr is not None:
            query = query.filter(Vacancy.name.like(f"{substr}%"))
        if employment_type_ids is not None:
            query = query.filter(
                Vacancy.employment_type_id.in_(id for id in employment_type_ids)
            )
        if work_schedule_ids is not None:
            query = query.filter(
                Vacancy.work_schedule_id.in_(id for id in work_schedule_ids)
            )
        if organization_ids is not None:
            query = query.filter(
                Vacancy.organization_id.in_(id for id in organization_ids)
            )

        if branch_ids is not None or training_direction_ids is not None:
            query = query.join(Organization)
            if branch_ids:
                query = query.filter(
                    Organization.branch_id.in_(id for id in branch_ids)
                )
            if training_direction_ids:
                query = query.filter(
                    Organization.training_direction_id.in_(
                        id for id in training_direction_ids
                    )
                )
        if salary is not None:
            query = query.filter(Vacancy.max_salary >= salary)
        vacancies = query.order_by(Vacancy.name).all()
        return [FullVacancy.from_orm(v) for v in vacancies]

    def get_all_full_organizations(
        self,
        organization_type_ids: list[int] | None,
        branch_ids: list[int] | None,
        training_direction_ids: list[int] | None,
        substr: str | None,
        score: int | None,
        session: Session,
    ):
        query = session.query(Organization).options(
            subqueryload(Organization.training_direction),
            subqueryload(Organization.reviews),
        )
        if organization_type_ids is not None:
            query = query.filter(
                Organization.type_id.in_(id for id in organization_type_ids)
            )
        if branch_ids is not None:
            query = query.filter(Organization.branch_id.in_(id for id in branch_ids))
        if training_direction_ids is not None:
            query = query.filter(
                Organization.training_direction_id.in_(
                    id for id in training_direction_ids
                )
            )
        if substr is not None:
            query = query.filter(Organization.name.like(f"{substr}%"))
        if score is not None:
            sub = (
                session.query(OrganizationReview.organization_id)
                .group_by(OrganizationReview.organization_id)
                .having(
                    func.sum(OrganizationReview.value)
                    / func.count(OrganizationReview.organization_id)
                    >= score
                )
                .subquery()
            )
            query = query.join(sub)
        organizations = query.order_by(Organization.name).all()
        orgs = []
        for v in organizations:
            org = OrganizationWithTrainingDirection.from_orm(v)
            review_count = len(v.reviews)
            org.review_count = review_count
            org.number_mentor = len(v.mentors)
            org.number_vacancy = len(v.vacancies)
            sum = 0
            for r in v.reviews:
                sum += r.value
            org.average_score = (sum / review_count) if review_count > 0 else 0
            orgs.append(org)
        return orgs

    def get_my_profile(self, session: Session, id: int):
        query = session.query(User).options(
            subqueryload(User.role),
            subqueryload(User.citizenship),
            subqueryload(User.intern).subqueryload(Intern.university),
            subqueryload(User.intern).subqueryload(Intern.branch),
            subqueryload(User.intern).subqueryload(Intern.course),
            subqueryload(User.intern).subqueryload(Intern.direction),
            subqueryload(User.intern).subqueryload(Intern.internship_status),
            subqueryload(User.intern).subqueryload(Intern.training_direction),
            subqueryload(User.intern).subqueryload(Intern.organization),
            subqueryload(User.intern)
            .subqueryload(Intern.skills)
            .subqueryload(SkillIntern.skill),
            subqueryload(User.city).subqueryload(City.region),
            subqueryload(User.hr).subqueryload(HR.organization),
            subqueryload(User.curator),
            subqueryload(User.mentor).subqueryload(Mentor.organization),
        )

        user = query.get(id)
        return FullUser.from_orm(user)

    def get_profile_by_nick(self, session: Session, nick: str):
        query = session.query(User).options(
            subqueryload(User.role),
            subqueryload(User.citizenship),
            subqueryload(User.intern).subqueryload(Intern.university),
            subqueryload(User.intern).subqueryload(Intern.branch),
            subqueryload(User.intern).subqueryload(Intern.course),
            subqueryload(User.intern).subqueryload(Intern.direction),
            subqueryload(User.intern).subqueryload(Intern.internship_status),
            subqueryload(User.intern).subqueryload(Intern.training_direction),
            subqueryload(User.intern).subqueryload(Intern.organization),
            subqueryload(User.intern)
            .subqueryload(Intern.skills)
            .subqueryload(SkillIntern.skill),
            subqueryload(User.city).subqueryload(City.region),
            subqueryload(User.hr).subqueryload(HR.organization),
            subqueryload(User.curator),
            subqueryload(User.mentor).subqueryload(Mentor.organization),
        )

        user = query.filter(User.nickname == nick).first()
        return FullUser.from_orm(user)

    def get_skill_by_ids(self, session: Session, id: int):
        return session.query(SkillIntern).get(id)

    def get_skill_by_ids_copy(self, session: Session, intern_id: int, skill_id: int):
        return (
            session.query(SkillIntern)
            .filter(
                SkillIntern.skill_id == skill_id, SkillIntern.intern_id == intern_id
            )
            .first()
        )

    def delete_my_skill(self, session: Session, id: int, skill_id: int):
        session.delete(self.get_skill_by_ids_copy(session, id, skill_id))
        session.commit()

    def get_add_skill(self, session: Session, skill: SkillIntern, id: int):
        if not self.get_skill_by_ids_copy(session, id, skill.skill_id):
            session.add(skill)
            session.commit()
            return True
        return False

    def get_skill_by_name(self, session: Session, skill_name: str):
        return session.query(Skill).filter(Skill.name == skill_name).first()

    def add_skill(self, session: Session, skill: Skill):
        res = self.get_skill_by_name(session, skill.name)
        if res:
            return res
        session.add(skill)
        session.commit()
        return self.get_skill_by_name(session, skill.name)

    def get_user_by_id(self, session: Session, id: int):
        return session.query(User).get(id)

    def get_test_by_id(self, session: Session, test_id: int, id: int):
        return (
            session.query(BasicTest)
            .filter(BasicTest.id == test_id, BasicTest.intern_id == id)
            .first()
        )

    def get_test_value(self, session: Session, id: int):
        return (
            session.query(func.sum(BasicTest.value))
            .group_by(
                BasicTest.intern_id,
            )
            .having(BasicTest.intern_id == id)
            .scalar()
        )

    def get_school_value(self, session: Session, id: int):
        return session.query(Scholl).filter(Scholl.intern_id == id).first()

    def get_interview_value(self, session: Session, id: int):
        return (
            session.query(Interview)
            .join(Selection)
            .filter(Selection.intern_id == id)
            .first()
        )

    def get_rating_intern(self, session: Session, id: int):
        tests_val = self.get_test_value(session, id)
        scholl = self.get_school_value(session, id)
        interview = self.get_interview_value(session, id)
        return (
            (tests_val if tests_val else 0)
            + (scholl.value if scholl and scholl.value else 0)
            + (interview.value if interview and interview.value else 0)
        )

    def get_rating_mentor(self, session: Session, id: int):
        mentor = session.query(Mentor).get(id)
        res = 0
        if mentor:
            cnt_r = len(mentor.reviews)
            sum = 0
            for r in mentor.reviews:
                sum += r.value
            res = (sum / cnt_r) if cnt_r > 0 else 0
        return res

    def get_intern_by_id(self, session: Session, id: int):
        return session.query(Intern).options(subqueryload(Intern.user)).get(id)

    def update_user(self, session: Session, user: User):
        session.add(user)
        session.commit()
        return True

    def update_basic_test(self, session: Session, test: BasicTest):
        session.add(test)
        session.commit()
        return True

    def delete_pfofile(self, session: Session, id: int):
        user = session.query(User).get(id)
        session.delete(user)
        session.commit()
        return True

    def get_stage_selection_by_name(self, session: Session, name: str):
        return session.query(Stage).filter(Stage.name == name).first()

    def get_selection_by_vacancy_id(self, session: Session, id: int, vacancy_id: int):
        return (
            session.query(Selection)
            .filter(Selection.intern_id == id, Selection.vacancy_id == vacancy_id)
            .first()
        )

    def get_status_response_by_name(self, session: Session, name: str):
        return (
            session.query(ResponseStatuse).filter(ResponseStatuse.name == name).first()
        )

    def get_basic_tests_by_id(self, session: Session, id: int):
        return session.query(BasicTest).filter(BasicTest.intern_id == id).all()

    def get_school_by_id(self, session: Session, id: int):
        return session.query(Scholl).filter(Scholl.intern_id == id).first()

    def get_school_by_id_to_front(self, session: Session, id: int):
        school = self.get_school_by_id(session, id)
        return PydanticSchollInDB.from_orm(school) if school else None

    def add_school(self, session: Session, school: Scholl):
        session.add(school)
        session.commit()
        return self.get_school_by_id(session, school.intern_id)

    def add_tests(self, session: Session, tests: BasicTest):
        session.add_all(tests)
        session.commit()
        return self.get_basic_tests_by_id(session, tests[0].intern_id)

    def get_vacancy_by_id(self, session: Session, id: int):
        return (
            session.query(Vacancy)
            .options(
                subqueryload(Vacancy.organization).subqueryload(Organization.branch),
                subqueryload(Vacancy.organization).subqueryload(
                    Organization.training_direction
                ),
            )
            .get(id)
        )

    def get_response_by_id(self, session: Session, id: int):
        return session.query(Response).options(subqueryload(Response.selection)).get(id)

    def put_response(self, session: Session, response: Response):
        session.add(response)
        session.commit()
        return True

    def update_intern(self, session: Session, user: Intern):
        session.add(user)
        session.commit()
        return True

    def get_user_by_email(
        self, session: Session, email: str
    ) -> UserWithRoleInDB | None:
        user = session.query(User).filter(User.email == email).first()
        return UserWithRoleInDB.from_orm(user) if user else None

    def delete_my_selection(self, session: Session, id: int, selection_id: int):
        session.delete(self.get_selection_by_ids(session, id, selection_id))
        session.commit()

    def get_status_responses(self, session: Session):
        statuses = session.query(ResponseStatuse).all()
        return [PydanticResponseStatuseInDB.from_orm(s) for s in statuses]

    def get_other_responses(self, session: Session, response_id: int, id: int):
        return (
            session.query(Response)
            .join(Selection)
            .filter(
                Response.id != response_id,
                Selection.intern_id == id,
                Response.passed != True,
            )
            .all()
        )

    def get_my_responses(self, session: Session, id: int, to_curator: bool):
        query = (
            session.query(Response)
            .join(Selection)
            .options(
                subqueryload(Response.response_status),
                subqueryload(Response.selection)
                .subqueryload(Selection.vacancy)
                .subqueryload(Vacancy.organization)
                .subqueryload(Organization.training_direction),
            )
        )
        if not to_curator:
            query = query.filter(Selection.intern_id == id)
        else:
            query = query.options(
                subqueryload(Response.selection).subqueryload(Selection.stage),
                subqueryload(Response.selection)
                .subqueryload(Selection.intern)
                .subqueryload(Intern.user)
                .subqueryload(User.city),
                subqueryload(Response.selection)
                .subqueryload(Selection.intern)
                .subqueryload(Intern.user)
                .subqueryload(User.citizenship),
                subqueryload(Response.selection)
                .subqueryload(Selection.intern)
                .subqueryload(Intern.course),
                subqueryload(Response.selection)
                .subqueryload(Selection.intern)
                .subqueryload(Intern.university),
            )
        query = query.order_by(Response.response_status_id)
        res = []
        for r in query.all():
            i = FullResponse.from_orm(r)
            scholl = self.get_school_value(session, i.selection.intern_id)
            i.selection.school_val = scholl.value if scholl else 0
            i.selection.basic_val = self.get_test_value(session, i.selection.intern_id)

            interview = self.get_interview_value(session, i.selection.intern_id)
            i.selection.interview_val = interview.value if interview else 0
            res.append(i)
        return res

    def get_selection_by_ids(self, session: Session, id: int, selection_id: int):
        return (
            session.query(Selection)
            .options(
                subqueryload(Selection.vacancy),
                subqueryload(Selection.stage),
                subqueryload(Selection.intern),
            )
            .filter(Selection.id == selection_id, Selection.intern_id == id)
            .first()
        )

    def get_selection_by_id(self, session: Session, selection_id: int):
        return session.query(Selection).get(selection_id)

    def get_internings(self, session: Session, user_id: int):
        return (
            session.query(Selection)
            .options(
                subqueryload(Selection.intern).subqueryload(Intern.user),
                subqueryload(Selection.vacancy)
                .subqueryload(Vacancy.organization)
                .subqueryload(Organization.training_direction),
                subqueryload(Selection.stage),
                subqueryload(Selection.vacancy)
                .subqueryload(Vacancy.mentor)
                .subqueryload(Mentor.user),
            )
            .filter(
                or_(Selection.stage_id == 3, Selection.stage_id == 7),
                Selection.intern_id == user_id,
            )
            .first()
        )

    def get_selection(self, session: Session, school_id: int):
        return (
            session.query(Selection)
            .join(Scholl)
            .filter(Scholl.id == school_id, Selection.stage_id == 2)
            .first()
        )

    def get_full_selections(self, session: Session, id: int, organization_id: int):
        selections = (
            session.query(Selection)
            .join(Interview)
            .options(
                subqueryload(Selection.vacancy),
                subqueryload(Selection.stage),
                subqueryload(Selection.intern),
            )
            .join(Vacancy, Vacancy.id == Selection.vacancy_id)
            .filter(
                Interview.passed,
                Selection.stage_id == 5,
                Vacancy.organization_id == organization_id,
            )
            .all()
        )
        res = []
        for s in selections:
            i = FullSelection.from_orm(s)
            scholl = self.get_school_value(session, i.intern_id)
            i.school_val = scholl.value if scholl else 0
            i.basic_val = self.get_test_value(session, i.intern_id)
            interview = self.get_interview_value(session, i.intern_id)
            i.interview_val = interview.value if interview else 0
            res.append(i)
        return res

    def get_my_base_tests(self, session: Session, id: int):
        tests = (
            session.query(BasicTest)
            .options(
                subqueryload(BasicTest.type_basic_test),
                subqueryload(BasicTest.basic_test_status),
            )
            .filter(BasicTest.intern_id == id)
            .all()
        )
        return [FullBasicTest.from_orm(t) for t in tests]

    def get_interns(self, session: Session, mentors: bool):
        query = session.query(User).options(
            subqueryload(User.intern).subqueryload(Intern.internship_status),
            subqueryload(User.intern).subqueryload(Intern.training_direction),
            subqueryload(User.intern)
            .subqueryload(Intern.skills)
            .subqueryload(SkillIntern.skill),
            subqueryload(User.city),
            subqueryload(User.mentor)
            .subqueryload(Mentor.organization)
            .subqueryload(Organization.branch),
        )
        if mentors:
            query = query.filter(User.role_id == 1)
        else:
            query = query.join(Intern).filter(Intern.internship_status_id == 2)
        interns = query.all()
        res = []
        for intern in interns:
            i = FullUser.from_orm(intern)
            if mentors:
                cnt_r = len(intern.mentor.reviews)
                sum = 0
                for r in intern.mentor.reviews:
                    sum += r.value
                i.rating = (sum / cnt_r) if cnt_r > 0 else 0
            else:
                i.rating = self.get_rating_intern(session, i.id)
            res.append(i)
        return res

    def add_item(self, session: Session, item):
        session.add(item)
        session.commit()
        return True

    def get_to_statistic(self, session: Session):
        res = (
            session.query(TrainingDirection)
            .options(
                subqueryload(TrainingDirection.organizations)
                .subqueryload(Organization.vacancies)
                .subqueryload(Vacancy.selections)
                .subqueryload(Selection.response)
            )
            .all()
        )
        result = []
        for r in res:
            i = FullToStatistic.from_orm(r)
            cnt_vac = 0
            cnt_res = 0
            cnt_suc = 0
            cnt_not_rec = 0
            for org in r.organizations:
                for vac in org.vacancies:
                    cnt_vac += 1
                    for sel in vac.selections:
                        cnt_res += 1
                        if sel.response.response_status_id == 3 or sel.stage_id == 6:
                            cnt_not_rec += 1
                        elif sel.stage_id == 3:
                            cnt_suc += 1
            i.cnt_vacancy = cnt_vac
            i.cnt_response = cnt_res
            i.cnt_not_recs = cnt_not_rec
            i.cnt_suc = cnt_suc
            result.append(i)
        return result

    def get_cnt_all_interns_by_work_experiens(self, session: Session):
        res = (
            session.query(WorkExperience)
            .options(subqueryload(WorkExperience.interns))
            .all()
        )
        result = []
        for r in res:
            i = WorkExperienceToStatistic.from_orm(r)
            i.cnt_intern = len(r.interns)
            result.append(i)
        return result

    def get_cnt_all_interns_by_university(self, session: Session):
        res = session.query(University).options(subqueryload(University.interns)).all()
        result = []
        for r in res:
            i = UniversityToStatistic.from_orm(r)
            i.cnt_intern = len(r.interns)
            result.append(i)
        return result

    def get_cnt_all_interns_by_direction(self, session: Session):
        res = (
            session.query(TrainingDirection)
            .options(subqueryload(TrainingDirection.interns))
            .all()
        )
        result = []
        for r in res:
            i = TrainingDirectionToStatistic.from_orm(r)
            i.cnt_intern = len(r.interns)
            result.append(i)
        return result

    def get_result_interview(self, session: Session, organization_id: int):
        res = (
            session.query(Selection)
            .join(Vacancy)
            .options(subqueryload(Selection.intern), subqueryload(Selection.stage))
            .filter(
                Vacancy.organization_id == organization_id,
                or_(Selection.stage_id == 3, Selection.stage_id == 6),
            )
        ).all()
        result = []
        for s in res:
            i = ShortSelection.from_orm(s)
            i.value = self.get_rating_intern(session, i.intern_id)
            result.append(i)
        return result

    def get_my_presence(self, session: Session, id: int):
        return (
            session.query(Presence)
            .options(
                subqueryload(Presence.intern).subqueryload(Intern.user),
                subqueryload(Presence.vacancy),
            )
            .filter(Presence.mentor_id == id)
            .order_by(Presence.date.desc())
            .all()
        )

    def get_my_interview(self, session: Session, id: int):
        return (
            session.query(Interview)
            .join(Selection)
            .options(
                subqueryload(Interview.selection)
                .subqueryload(Selection.vacancy)
                .subqueryload(Vacancy.tasks),
                subqueryload(Interview.selection)
                .subqueryload(Selection.vacancy)
                .subqueryload(Vacancy.organization),
                subqueryload(Interview.selection)
                .subqueryload(Selection.vacancy)
                .subqueryload(Vacancy.mentor)
                .subqueryload(Mentor.user),
            )
            .filter(Selection.intern_id == id)
            .first()
        )

    def get_my_notes(self, session: Session, user_id: int, limit: int | None):
        query = (
            session.query(Note)
            .filter(Note.user_id == user_id)
            .order_by(Note.created.desc())
        )
        if limit:
            query = query.limit(limit)
        return query.all()

    def post_note(self, session: Session, note: Note):
        session.add(note)
        session.commit()

    def add_notes(self, session: Session, notes: list[Note]):
        session.add_all(notes)
        session.commit()

    def get_cnt_note_not_read(self, session: Session, user_id: int):
        return (
            session.query(func.count(Note.id))
            .filter(Note.user_id == user_id, Note.is_readed == False)
            .scalar()
        )
