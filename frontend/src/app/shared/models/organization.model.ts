import { Branch } from './branch.model';
import { TrainingDirection } from './training_direction.model';
import { TypeOrganization } from './type_org.model';

export class Organization {
  constructor(
    public id: number,
    public name: string,
    public description: string,
    public img: string,
    public address: string,
    public latitude: number,
    public longitude: number,
    public email: string,
    public phone: string,
    public training_direction_id: number,
    public branch_id: number,
    public type_id: number,
    public training_direction: TrainingDirection,
    public review_count?: number,
    public average_score?: number,
    public number_vacancy?: number,
    public number_mentor?: number,
    public type?: TypeOrganization,
    public branch?: Branch,
  ) {}
}

export class ShortOrganization {
  constructor(
    public id: number,
    public name: string,
    public description: string,
    public img: string,
    public address: string,
    public latitude: number,
    public longitude: number,
    public email: string,
    public phone: string,
    public training_direction_id: number,
    public branch_id: number,
    public type_id: number,
    public training_direction: TrainingDirection
  ) {}
}

export class CreateOrganization {
  constructor(
    public name: any,
    public description: any,
    public address: any,
    public latitude: number,
    public longitude: number,
    public email: any,
    public phone: any,
    public training_direction_id?: number,
    public branch_id?: number,
    public type_id?: number,
    public img?: any
  ) {}
}
