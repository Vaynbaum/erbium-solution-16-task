import { Skill } from './skill.model';

export class SkillVacancy {
  constructor(
    public skill_id: number,
    public vacancy_id: number,
    public skill: Skill
  ) {}
}
