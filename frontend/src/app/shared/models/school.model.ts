export class School {
  constructor(
    public value: string,
    public comment: string,
    public passed: boolean,
    public id: number,
    public intern_id: number
  ) {}
}
export class UpdateSchool {
  constructor(
    public id: number,
    public passed: boolean,
    public value: number
  ) {}
}
