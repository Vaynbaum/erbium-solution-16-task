import { InternSelection } from './intern.model';
import { Stage } from './stage.model';
import { ShortVacancy } from './vacancy.model';

export class Selection {
  constructor(
    public vacancy_id: number,
    public stage_id: number,
    public intern_id: number,
    public vacancy: ShortVacancy,
    public id: number,
    public stage?: Stage,
    public intern?: InternSelection,
    public school_val?: number,
    public basic_val?: number
  ) {}
}
