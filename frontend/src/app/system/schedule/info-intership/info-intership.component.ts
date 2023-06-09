import { ProfileService } from './../../../shared/services/profile.service';
import { UserService } from 'src/app/shared/services/user.service';
import { STEPPER_GLOBAL_OPTIONS } from '@angular/cdk/stepper';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { DialogInfoIntershipAddComponent } from '../../shared/dialog-info-intership-add/dialog-info-intership-add.component';

export interface DialogData {
  id: number;
  org_id: number;
  name_nast: string;
}
@Component({
  selector: 'app-info-intership',
  templateUrl: './info-intership.component.html',
  styleUrls: ['./info-intership.component.scss'],
  providers: [
    {
      provide: STEPPER_GLOBAL_OPTIONS,
      useValue: { displayDefaultIndicatorType: false },
    },
  ],
})
export class InfoIntershipComponent {
  interning: any;
  id_zaglushka: number = 0;
  name_nast_zaglushka: string = '';
  constructor(
    private profileService: ProfileService,
    private userService: UserService,
    private _formBuilder: FormBuilder,
    public dialog: MatDialog
  ) {}
  firstFormGroup = this._formBuilder.group({});
  secondFormGroup = this._formBuilder.group({
    secondCtrl: [''],
  });
  vacancy_cards: number[] = [1, 2, 3];
  ngOnInit(): void {
    this.profileService.ProfileLoaded.subscribe((profile) => {
      this.userService.MyInterning(profile.id).subscribe((interning) => {
        this.interning = interning;
      });
    });
    this.profileService.GetProfile();
  }
  pass_the: boolean = true;
  passed: boolean = true;
  not_passed: boolean = true;
  openDialog(id: number, org_id: number, name_nast: string) {
    const dialogRef = this.dialog.open(DialogInfoIntershipAddComponent, {
      width: '600px',
      height: '540px',
      data: {
        id: id,
        org_id: org_id,
        name_nast: name_nast,
      },
    });
  }
  getFullName(vacancy: any) {
    this.name_nast_zaglushka = `${vacancy.mentor.user.lastname} ${vacancy.mentor.user.firstname[0]}.${vacancy.mentor.user.patronymic[0]}.`;
    this.id_zaglushka = vacancy.mentor.id;
    return this.name_nast_zaglushka;
  }
}
