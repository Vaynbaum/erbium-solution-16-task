import { Organization } from './organization.model';
import { Сitizenship } from './citizenship.model';
import { FullCity } from './city.model';
import { Curator } from './curator.model';
import { HR } from './hr.model';
import { Intern } from './intern.model';
import { Mentor } from './mentor.model';
import { Role } from './role.model';

export class SigninModel {
  constructor(private username: any, private password: any) {}
}

export class SignupModel {
  constructor(
    private firstname: any,
    private lastname: any,
    private patronymic: any,
    private birthdate: any,
    private phone: any,
    private password: any,
    private email: any,
    private city?: any,
    private citizenship?: any,
    private university?: any,
    private course?: any,
    private region?: any,
    private direction?: any
  ) {}
}
export class SignupHiddenModel {
  constructor(
    private firstname: any,
    private lastname: any,
    private patronymic: any,
    private birthdate: any,
    private phone: any,
    private password: any,
    private email: any,
    private city_id: any,
    private citizenship_id: any,
    private code: any,
    private organization_id?: any,
    private training_direction_id?: any,
  ) {}
}

export class UpdateUserModel {
  constructor(
    private firstname: string,
    private lastname: string,
    private patronymic: string,
    private birthdate: number,
    private phone: string,
    private email: string,
    private gender: boolean,
    private city_id: number,
    private citizenship_id: number
  ) {}
}

export class FullUser {
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
    public role: Role,
    public city: FullCity,
    public citizenship: Сitizenship,
    public img?: string,
    public intern?: Intern,
    public hr?: HR,
    public curator?: Curator,
    public mentor?: Mentor,
    public rating?: number
  ) {}
}
