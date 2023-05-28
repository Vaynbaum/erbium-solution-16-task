import { City } from './city.model';

export class University {
  constructor(
    public name: string,
    public city_id: number,
    public city?: City,
    public sub?: string,
    public id?: number
  ) {}
}
