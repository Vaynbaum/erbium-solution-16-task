import { Component, Pipe, PipeTransform } from '@angular/core';

@Pipe({name: 'groupByDate'})
export class GroupByPipe implements PipeTransform {
    transform(collection: Array<any>, property: string = 'created'): Array<any> | null {
        if(!collection) {
            return null;
        }
        for (let i=0; i<collection.length; i++){
            collection[i]['date_copy']= collection[i]['created']
            collection[i]['created']=collection[i]['created'].toString().split('T').slice(0, 1).join(' ')
            console.log( collection[i]['created'])
        }
        const gc = collection.reduce((previous, current)=> {
            if(!previous[current[property]]) {
                previous[current[property]] = [current];
            } else {
                previous[current[property]].push(current);
            }
                
            return previous;
        }, {});
        return Object.keys(gc).map(key => ({ key, value: gc[key] }));
    }
}