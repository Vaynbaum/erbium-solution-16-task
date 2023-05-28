import { Pipe, PipeTransform } from '@angular/core';
import { FullUser } from '../models/user.model';
import { Selection } from '../models/selection.model'
@Pipe({
    name: 'filterSelections',
  })
  export class filterSelections implements PipeTransform {
    transform(
      items: Selection[],
      dir?: any,
      vacancy?: any,
      all_time?: any,
    ): any {
    let res=items;
    if (dir) {
        res = res.filter((i) => {
          return (
            i.vacancy.organization.training_direction.name
              .toLowerCase()
              .indexOf(dir.toString().toLowerCase()) !== -1
          );
        });
      }
      if (vacancy) {
        res = res.filter((i) => {
          return (
            i.vacancy.name
              .toLowerCase()
              .indexOf(vacancy.toString().toLowerCase()) !== -1
          );
        });
      }
      if (all_time) {
        let currentDate = new Date();
        res = res.filter((i) => {
          let vacDate = new Date(i.vacancy.date_end)
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
    return res;
  }
}
  