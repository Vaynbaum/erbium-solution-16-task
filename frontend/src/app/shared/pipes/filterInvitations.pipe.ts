import { Pipe, PipeTransform } from '@angular/core';
import { Vacancy } from '../models/vacancy.model';
import { SkillIntern } from '../models/skill_intern.model';
@Pipe({
    name: 'filterInvitations',
  })
  export class filterInvitations implements PipeTransform {
    transform(
      items: Vacancy[],
      intern_skills?: SkillIntern[],
    ): any {
    let res=items;
    if (intern_skills){
        res=res.filter((i)=>{
            let skills: string[] = [] 
            let in_skills: string[] = []
            let flag: boolean = false
            intern_skills.forEach(skill => {
                skills.push(skill.skill.name)
            })
            i.skills.forEach(skill => {
                in_skills.push(skill.skill.name)
            })
            in_skills.forEach(skillCompare => {
                skills.forEach(skillCard => {
                    if (skillCompare == skillCard){
                        flag=true
                    }
                })
            })
            return flag
        })
        // i.intern?.skills.forEach(skil => {
        //     if (skil.skill.name.toLowerCase().indexOf(skill.toString().toLowerCase()) !== -1){
        //         flag = true
        //     }
        // })
        // res=res.filter((i) => {
        //     if (i.rating != null){
        //       return(
        //         Number(rating) <= i.rating
        //       )
        //     }else{
        //     return(false)}
        //   })
    }
    return res;
  }
}
  