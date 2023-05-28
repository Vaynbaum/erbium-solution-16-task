import { Сitizenship } from './citizenship.model';
import { FullCity } from './city.model';

export class ShortUser {
  constructor(
    public id: number,
    public email: string,
    public phone: string,
    public firstname: string,
    public lastname: string,
    public patronymic: string,
    public birthdate: Date,
    public nickname: string,
    public role_id: number,
    public city_id: number,
    public citizenship_id: number,
    public is_verified: boolean,
    public gender: boolean,
    public city: FullCity,
    public citizenship: Сitizenship,
    public img?: string,
  ) {}
}
