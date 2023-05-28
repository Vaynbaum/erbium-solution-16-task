import { TrainingDirection } from './training_direction.model';

export class Curator {
  constructor(
    public id: number,
    public training_direction_id: number,
    public direction?: TrainingDirection
  ) {}
}
