import { STEPPER_GLOBAL_OPTIONS } from '@angular/cdk/stepper';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { Vacancy } from 'src/app/shared/models/vacancy.model';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { DialogInfoIntershipAddComponent } from '../../shared/dialog-info-intership-add/dialog-info-intership-add.component';

export interface DialogData {
  id: number;
  name_nast: string;
}
@Component({
  selector: 'app-info-intership',
  templateUrl: './info-intership.component.html',
  styleUrls: ['./info-intership.component.scss'],
  providers: [
    {
      provide: STEPPER_GLOBAL_OPTIONS,
      useValue: {displayDefaultIndicatorType: false},
    },
  ],
})
export class InfoIntershipComponent {
  id_zaglushka: number=1
  name_nast_zaglushka: string='Исаев М.А.'
  constructor(private vacancyService: VacancyService, private _formBuilder: FormBuilder, public dialog: MatDialog){}
  firstFormGroup = this._formBuilder.group({
    
  });
  secondFormGroup = this._formBuilder.group({
    secondCtrl: [''],
  });
  vacancy_cards: number[]=[1,2,3]
  ngOnInit(): void {
    
    
  }
  pass_the: boolean = true;
  passed: boolean = true;
  not_passed: boolean = true;
  openDialog(id: number, name_nast: string){
    const dialogRef = this.dialog.open(DialogInfoIntershipAddComponent, {
      width: '600px',
      height: '540px',
      data: { 
        id:id, name_nast:name_nast
      },
    });
  }
}
