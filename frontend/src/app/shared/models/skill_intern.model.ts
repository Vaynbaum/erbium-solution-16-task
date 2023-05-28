import { Skill } from './skill.model';

export class SkillIntern {
  constructor(
    public skill_id: number,
    public intern_id: number,
    public skill: Skill
  ) {}
}
