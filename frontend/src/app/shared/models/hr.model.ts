import { Organization } from './organization.model';

export class HR {
  constructor(
    public id: number,
    public organization_id: number,
    public organization?: Organization
  ) {}
}
