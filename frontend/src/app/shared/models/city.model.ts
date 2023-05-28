import { Region } from './region.model';

export class City {
  constructor(
    public name: string,
    public region_id: number,
    public id?: number
  ) {}
}

export class FullCity {
  constructor(
    public name: string,
    public region_id: number,
    public region?: Region,
    public id?: number
  ) {}
}
