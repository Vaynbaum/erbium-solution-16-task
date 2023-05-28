import { Router } from '@angular/router';
import {
  BasicTest,
  UpdateBasicTest,
} from './../../../shared/models/base_test.model';
import { UserService } from 'src/app/shared/services/user.service';
import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { showMessage } from 'src/app/auth/common';
import { MatSnackBar } from '@angular/material/snack-bar';
const MATCH_COLOR: any = {
  Пройти: 'pass_the',
  Пройдено: 'passed',
  'Не пройдено': 'not_passed',
};
@Component({
  selector: 'app-testing',
  templateUrl: './testing.component.html',
  styleUrls: ['./testing.component.scss'],
})
export class TestingComponent implements OnInit {
  constructor(
    private userService: UserService,
    private _snackBar: MatSnackBar
  ) {}
  loaded = false;
  empty = false;
  @Output() onPassed = new EventEmitter<any>();

  basic_tests: BasicTest[] = [];
  ngOnInit(): void {
    this.loadTest();
  }

  loadTest() {
    this.userService.GetAllBasicTests().subscribe((basic_tests) => {
      this.basic_tests = basic_tests as BasicTest[];
      if (this.basic_tests.length == 0) this.empty = true;
      else this.empty = false;
      this.loaded = true;
    });
  }

  toPass(test: BasicTest) {
    if (test.basic_test_status.name == 'Пройти') {
      this.userService.GotoTest(test).subscribe((res: any) => {
        window.open(res.url, '_blank');
        this.userService
          .SaveTest(
            new UpdateBasicTest(test.id, res.status_id, res.passed, res.value)
          )
          .subscribe(
            (res: any) => {
              showMessage(this._snackBar, res.message);
              this.loadTest();
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

  valueDisplay(test: BasicTest) {
    return test.value != undefined || test.value != null ? test.value : '-';
  }

  mathClass(test: BasicTest) {
    return MATCH_COLOR[test.basic_test_status.name];
  }

  pass_the: boolean = true;
  passed: boolean = true;
  not_passed: boolean = true;
}
