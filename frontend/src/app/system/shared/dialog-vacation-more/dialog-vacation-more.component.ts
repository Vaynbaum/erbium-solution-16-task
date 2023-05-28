import { MatSnackBar } from '@angular/material/snack-bar';
import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { showMessage } from 'src/app/auth/common';
import { Vacancy } from 'src/app/shared/models/vacancy.model';
import { UserService } from 'src/app/shared/services/user.service';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { Router } from '@angular/router';

export interface DialogData {
  vacancy: Vacancy;
}

@Component({
  selector: 'app-dialog-vacation-more',
  templateUrl: './dialog-vacation-more.component.html',
  styleUrls: ['./dialog-vacation-more.component.scss'],
})
export class DialogVacationMoreComponent implements OnInit {
  constructor(
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private userService: UserService,
    private router: Router,
    private _snackBar: MatSnackBar
  ) {}
  vacancy_cards: any;
  ngOnInit(): void {}
  submit() {
    console.log(this.data.vacancy);
  }
  gotoTesting() {
    this.router.navigate(['/system/selection'], {
      queryParams: {
        testing: true,
      },
    });
  }
  postRenspone(vacancy: Vacancy) {
    this.userService.PostRenspone(vacancy.id).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
      },
      (err) => {
        if (Array.isArray(err.error.detail)) {
          showMessage(this._snackBar, err.error.detail[0].msg);
        } else if (err.error.detail) {
          showMessage(this._snackBar, err.error.detail);
        }
      }
    );
  }
}
