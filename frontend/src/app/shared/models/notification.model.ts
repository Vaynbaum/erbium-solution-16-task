export class Notification {
  constructor(
    public id: number,
    public user_id: number,
    public text: string,
    public created: Date,
    public is_readed: boolean
  ) {}
}
