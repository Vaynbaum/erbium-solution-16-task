import { MatSnackBar } from '@angular/material/snack-bar';
import { SigninModel } from './../../shared/models/user.model';
import { AuthService } from './../../shared/services/auth.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { Input } from 'src/app/shared/models/input.model';
import { createEmailInput, createPasswordInput, showMessage } from '../common';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['../auth.component.scss', './login.component.scss'],
})
export class LoginComponent implements OnInit {
  title = 'Авторизация';
  subtitle = 'Пожалуйста, войдите в систему, чтобы получить доступ к порталу';
  nameButton = 'Войти';

  form = new FormGroup({
    email: new FormControl(null, [Validators.required, Validators.email]),
    password: new FormControl(null, [
      Validators.required,
      Validators.minLength(8),
    ]),
  });

  inputs: Input[] = [
    createEmailInput(this.form),
    createPasswordInput(this.form),
  ];

  signin() {
    const { email, password } = this.form.value;
    showMessage(this._snackBar, 'Происходит вход в личный кабинет...');
    let sub = this.authService.Authed.subscribe((res) => {
      sub.unsubscribe();
      if (res.res) {
        this.router.navigate(['/system/profile'], {
          queryParams: {
            auth: true,
          },
        });
      } else {
        if (Array.isArray(res.msg.error.detail)) {
          showMessage(this._snackBar, res.msg.error.detail[0].msg);
        } else if (res.msg.error.detail) {
          showMessage(this._snackBar, res.msg.error.detail);
        }
      }
    });
    this.authService.Signin(new SigninModel(email, password));
  }

  constructor(
    private authService: AuthService,
    private router: Router,
    private route: ActivatedRoute,
    private _snackBar: MatSnackBar
  ) {}

  ngOnInit(): void {
    this.route.queryParams.subscribe((params: Params) => {
      if (params['authAgain']) {
        showMessage(this._snackBar, 'Необходимо заново авторизоваться');
      } else if (params['logoutSuccess']) {
        showMessage(this._snackBar, 'Вы вышли из аккаунта');
      } else if (params['message']) {
        showMessage(this._snackBar, params['message']);
      }
    });
  }
}
