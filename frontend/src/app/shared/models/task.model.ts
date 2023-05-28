export class CreateTask {
  constructor(
    public vacancy_id: string,
    public training_direction_id: number,
    public url_task: string,
    public mentor_id: number
  ) {}
}
