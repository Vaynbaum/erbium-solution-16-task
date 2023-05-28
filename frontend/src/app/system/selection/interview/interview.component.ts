import { Component } from '@angular/core';
import { Vacancy } from 'src/app/shared/models/vacancy.model';
import { VacancyService } from 'src/app/shared/services/vacancy.service';

@Component({
  selector: 'app-interview',
  templateUrl: './interview.component.html',
  styleUrls: ['./interview.component.scss']
})
export class InterviewComponent {
  constructor(private vacancyService: VacancyService){}
  vacancy_cards: Vacancy[] = [];
  ngOnInit(): void {
    this.vacancyService.GetAllVacanciesWithFilters().subscribe(
      (items: any)=>(this.vacancy_cards=items)
    );
  }
}
