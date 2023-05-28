import { Branch } from './branch.model';
import { Condition } from './condition.model';
import { Duty } from './duty.model';
import { EmploymentType } from './employment_type.model';
import { Organization, ShortOrganization } from './organization.model';
import { Requirement } from './requirement.model';
import { SkillVacancy } from './skill_vacancy.model';
import { VacancyModel } from './vacancy_status.model';
import { WorkExperience } from './work_experience.model';
import { WorkSchedule } from './work_schedule.model';
export class Vacancy {
  constructor(
    public id: number,
    public name: string,
    public description: string,
    public min_salary: number,
    public max_salary: number,
    public date_begin: Date,
    public date_end: Date,
    public published: boolean,
    public work_schedule_id: number,
    public organization_id: number,
    public employment_type_id: number,
    public hr_creater_id: number,
    public mentor_id: number,
    public work_experience_id: number,
    public organization: Organization,
    public skills: SkillVacancy[],
    public requirements: Requirement[],
    public conditions: Condition[],
    public duties: Duty[],
    public work_experience: WorkExperience,
    public work_schedule: WorkSchedule,
    public employment_type: EmploymentType,
    public cnt_intern: number,
    public status?: VacancyModel
  ) {}
}

export class ShortVacancy {
  constructor(
    public id: number,
    public name: string,
    public description: string,
    public min_salary: number,
    public max_salary: number,
    public date_begin: Date,
    public date_end: Date,
    public published: boolean,
    public work_schedule_id: number,
    public organization_id: number,
    public employment_type_id: number,
    public hr_creater_id: number,
    public mentor_id: number,
    public work_experience_id: number,
    public organization: ShortOrganization,
    public cnt_intern: number
  ) {}
}

export class CreateVacancy {
  constructor(
    public name: any,
    public description: any,
    public min_salary: any,
    public max_salary: any,
    public date_begin: any,
    public date_end: any,
    public work_schedule_id: any,
    public organization_id: any,
    public employment_type_id: any,
    public hr_creater_id: any,
    public work_experience_id: any,
    public cnt_intern: any,
    public conditions: any,
    public requirements: any,
    public duties: any,
    public skills: any
  ) {}
}
