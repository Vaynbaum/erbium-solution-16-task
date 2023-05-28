import { Pipe, PipeTransform } from '@angular/core';
import { FullUser } from '../models/user.model';
@Pipe({
    name: 'filterMentors',
  })
  export class filterMentors implements PipeTransform {
    transform(
      items: FullUser[],
      dir?: any,
      branch?: any,
      organization?: any,
      city?: any,
      rating?: any,
    ): any {
    let res=items;
    if (dir) {
      res = res.filter((i) => {
        return (
            i.mentor?.organization?.training_direction.name
            .toLowerCase()
            .indexOf(dir.toString().toLowerCase()) !== -1
        );
      });
    }
    if (branch) {
      res = res.filter((i) => {
        console.log(i.mentor?.organization?.branch?.name)
        return (
          i.mentor?.organization?.branch?.name
            .toLowerCase()
            .indexOf(branch.toString().toLowerCase()) !== -1
        );
      });
    }
    if (organization) {
      res = res.filter((i) => {
        return (
          i.mentor?.organization?.name
            .toLowerCase()
            .indexOf(organization.toString().toLowerCase()) !== -1
        );
      });
    }
    if (city) {
      res = res.filter((i) => {
          return (
          i.city.name
              .toLowerCase()
              .indexOf(city.toString().toLowerCase()) !== -1
          );
      });
  }
    if(rating) {
      res=res.filter((i) => {
        if (i.rating != null){
          return(
            Number(rating) <= i.rating
          )
        }else{
        return(false)}
      })
    }
    return res;
  }
}
  