import { MatSnackBar } from '@angular/material/snack-bar';
import { School, UpdateSchool } from './../../../shared/models/school.model';
import { UserService } from 'src/app/shared/services/user.service';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { showMessage } from 'src/app/auth/common';

@Component({
  selector: 'app-school',
  templateUrl: './school.component.html',
  styleUrls: ['./school.component.scss'],
})
export class SchoolComponent implements OnInit {
  constructor(
    private userService: UserService,
    private _snackBar: MatSnackBar
  ) {}
  @Output() onPassed = new EventEmitter<any>();
  school: School | any = null;
  ngOnInit() {
    this.loadSchool();
  }

  loadSchool() {
    this.userService.GetMyScholl().subscribe((school: any) => {
      this.school = school;
    });
  }

  goToSchool() {
    this.userService.GotoSchool().subscribe((res: any) => {
      window.open(res.url, '_blank');
      this.userService
        .SaveSchool(new UpdateSchool(this.school.id, res.passed, res.value))
        .subscribe(
          (res: any) => {
            showMessage(this._snackBar, res.message);
            this.loadSchool();
            this.onPassed.emit();
          },
          (err) => {
            if (Array.isArray(err.error.detail)) {
              showMessage(this._snackBar, err.error.detail[0].msg);
            } else if (err.error.detail) {
              showMessage(this._snackBar, err.error.detail);
            }
          }
        );
    });
  }
}
