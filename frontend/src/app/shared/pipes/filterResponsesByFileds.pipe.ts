import { Pipe, PipeTransform } from '@angular/core';
import { Response } from 'src/app/shared/models/response.model';

@Pipe({
  name: 'filterResponsesByFileds',
})
export class filterResponsesByFileds implements PipeTransform {
  transform(
    items: Response[],
    status?: any,
    org?: any,
    dir?: any,
    vac?: any,
    reqs?: any,
    flag?: boolean,
    all_time?: any,
  ): any {
    let res = items;
    if (status) {
      res = res.filter((i) => {
        return (
          i.response_status.name
            .toLowerCase()
            .indexOf(status.toString().toLowerCase()) !== -1
        );
      });
    }
    if (org) {
      res = res.filter((i) => {
        return (
          i.selection.vacancy.organization.name
            .toLowerCase()
            .indexOf(org.toString().toLowerCase()) !== -1
        );
      });
    }
    if (dir) {
      res = res.filter((i) => {
        return (
          i.selection.vacancy.organization.training_direction.name
            .toLowerCase()
            .indexOf(dir.toString().toLowerCase()) !== -1
        );
      });
    }
    if (vac) {
      res = res.filter((i) => {
        return (
          i.selection.vacancy.name
            .toLowerCase()
            .indexOf(vac.toString().toLowerCase()) !== -1
        );
      });
    }
    if (reqs) {
      res = res.filter((i) => {
        return this.hideCheck(i, reqs);
      });
    }
    if (all_time) {
      let currentDate = new Date();
        res = res.filter((i) => {
          let vacDate = new Date(i.selection.vacancy.date_end)
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
  hideCheck(i: any, reqs: any[]) {
    let res = true;
    reqs.forEach((req: any) => {
      let cur = req.checked ? !req.check(i.selection.intern) : true;
      res = res && cur;
    });
    return res;
  }
}
