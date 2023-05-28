import { Organization } from './organization.model';

export class Mentor {
  constructor(
    public id: number,
    public organization_id: number,
    public organization?: Organization
  ) {}
}
