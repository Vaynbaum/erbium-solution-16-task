import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Input } from 'src/app/shared/models/input.model';
import { createPasswordInput, redirect, showMessage } from '../common';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { AuthService } from 'src/app/shared/services/auth.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { NO_CODE } from 'src/app/shared/consts';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['../auth.component.scss', './reset-password.component.scss'],
})
export class ResetPasswordComponent implements OnInit {
  title = 'Изменение пароля';
  nameButton = 'Изменить пароль';
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private authService: AuthService,
    private _snackBar: MatSnackBar
  ) {}
  form: FormGroup = new FormGroup({
    password: new FormControl(null, [
      Validators.required,
      Validators.minLength(8),
    ]),
  });
  isReset = false;
  code = null;
  inputs: Input[] = [createPasswordInput(this.form, 'Введите новый пароль')];
  ngOnInit() {
    this.route.queryParams.subscribe((params: Params) => {
      this.code = params['code'];
    });
  }

  resetPassword() {
    const { password } = this.form.value;
    if (this.code) {
      showMessage(this._snackBar, 'Идет сохранение пароля...');
      this.authService.ResetPassword(this.code, password).subscribe(
        (result: any) => {
          showMessage(this._snackBar, result.message);
          this.isReset = true;
        },
        (err) => {
          if (Array.isArray(err.error.detail)) {
            showMessage(this._snackBar, err.error.detail[0].msg);
          } else if (err.error.detail) {
            showMessage(this._snackBar, err.error.detail);
          }
        }
      );
    } else {
      showMessage(this._snackBar, NO_CODE);
    }
  }
}
