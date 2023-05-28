import { Branch } from './branch.model';
import { Course } from './course.model';
import { Direction } from './direction.model';
import { InternshipStatus } from './internship_status.model';
import { LanguageIntern } from './language_intern.model';
import { Organization } from './organization.model';
import { ShortUser } from './shortuser.model';
import { SkillIntern } from './skill_intern.model';
import { TrainingDirection } from './training_direction.model';
import { University } from './university.model';
import { WorkExperience } from './work_experience.model';

export class Intern {
  constructor(
    public id: number,
    public university_id: number,
    public course_id: number,
    public direction_id: number,
    public internship_status_id: number,
    public training_direction_id: number,
    public volunteering: boolean,
    public university: University,
    public course: Course,
    public direction: Direction,
    public internship_status: InternshipStatus,
    public training_direction: TrainingDirection,
    public skills: SkillIntern[],
    public languages: LanguageIntern[],
    public about_me?: string,
    public branch?: Branch,
    public branch_id?: number,
    public organizations?: string,
    public organization_id?: number,
    public organization?: Organization,
    public work_experience_id?: number,
    public work_experience?: WorkExperience,
    public github?: string,
    public vk?: string,
    public portfolio?: string,
    public url_portfolio?: string
  ) {}
}

export class UpdateInternModel {
  constructor(
    public university_id: number,
    public organization_id: number,
    public course_id: number,
    public direction_id: number,
    public training_direction_id: number,
    public about_me: string,
    public branch_id: number,
    public organizations: string,
    public work_experience_id: number,
    public github: string,
    public vk: string,
    public portfolio: string
  ) {}
}

export class InternSelection {
  constructor(
    public id: number,
    public university_id: number,
    public course_id: number,
    public direction_id: number,
    public internship_status_id: number,
    public training_direction_id: number,
    public volunteering: boolean,
    public university: University,
    public course: Course,
    public about_me?: string,
    public branch_id?: number,
    public organization_id?: number,
    public work_experience_id?: number,
    public portfolio?: string,
    public user?: ShortUser,
    public url_portfolio?: string
  ) {}
}
