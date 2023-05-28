import { Pipe, PipeTransform } from '@angular/core';
import { Vacancy } from '../models/vacancy.model';
@Pipe({
    name: 'filterVacancyCards',
  })
  export class filterVacancyCards implements PipeTransform {
    transform(
      items: Vacancy[],
      status?: any,
      direction?: any,
      industry?: any,
      organization?: any,
      all_time?: any,
      vacancy?: any,
    ): any {
      let res=items;
      if(status){
        res = res.filter((i) => {
          return (
            i.status?.name
              .toLowerCase()
              .indexOf(status.toString().toLowerCase()) !== -1
          );
        });
      }
      if(direction){
        res = res.filter((i) => {
          return (
            i.organization.training_direction.name
              .toLowerCase()
              .indexOf(direction.toString().toLowerCase()) !== -1
          );
        });
      }
      if(industry){
        res = res.filter((i) => {
          return (
            i.organization.branch?.name
              .toLowerCase()
              .indexOf(industry.toString().toLowerCase()) !== -1
          );
        });
      }
      if(organization){
        res = res.filter((i) => {
          return (
            i.organization.name
              .toLowerCase()
              .indexOf(organization.toString().toLowerCase()) !== -1
          );
        });
      }
      if(all_time){
        let currentDate = new Date();
        console.log('huy')
        res = res.filter((i) => {
        let vacDate = new Date(i.date_end)
        let result = (currentDate.getTime() - vacDate.getTime()) / (1000*3600*24)
        if (all_time == 'За неделю'){
            return (
            (result <=7) && (result >= 0)
            );
        } else if (all_time == 'За месяц'){
            return (
            (result <=30) && (result >= 0)
            );
        } else{
            return true
        }
        });
      }
      if(vacancy){
        res = res.filter((i) => {
          return (
            i.name
              .toLowerCase()
              .indexOf(vacancy.toString().toLowerCase()) !== -1
          );
        });
      }
    return res;
  }
}
  