export class Notification {
    constructor(
      public id: number,
      public user_id: number,
      public message: string,
      public date: Date,
    ) {}
  }