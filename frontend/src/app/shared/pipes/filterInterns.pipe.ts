import { Pipe, PipeTransform } from '@angular/core';
import { FullUser } from '../models/user.model';
@Pipe({
    name: 'filterInterns',
  })
  export class filterInterns implements PipeTransform {
    transform(
      items: FullUser[],
      dir?: any,
      branch?: any,
      organization?: any,
      skill?: any,
      city?: any,
      rating?: any,
    ): any {
    let res=items;
    if (dir) {
        res = res.filter((i) => {
          return (
            i.intern?.training_direction.name
              .toLowerCase()
              .indexOf(dir.toString().toLowerCase()) !== -1
          );
        });
      }
    if (organization) {
        res = res.filter((i) => {
            return (
            i.intern?.organization?.name
                .toLowerCase()
                .indexOf(organization.toString().toLowerCase()) !== -1
            );
        });
    }
    if (branch) {
        res = res.filter((i) => {
            return (
            i.intern?.branch?.name
                .toLowerCase()
                .indexOf(branch.toString().toLowerCase()) !== -1
            );
        });
    }
    if (skill) {
        res = res.filter((i) => {
            let flag = false
            i.intern?.skills.forEach(skil => {
                if (skil.skill.name.toLowerCase().indexOf(skill.toString().toLowerCase()) !== -1){
                    flag = true
                }
            })
            return (
                flag
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
    if (rating) {
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
  