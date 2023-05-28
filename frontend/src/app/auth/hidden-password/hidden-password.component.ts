import { Component, OnInit } from '@angular/core';
import {
  AbstractControl,
  FormControl,
  FormGroup,
  ValidationErrors,
  ValidatorFn,
  Validators,
} from '@angular/forms';
import {
  createEmailInput,
  createFieldInput,
  createPasswordInput,
  createDateInput,
  createPhoneInput,
  showMessage,
  FIRSTNAME,
  LASTNAME,
  PATRONYMIC,
  PHONE,
  CITY,
  COUNTRY,
  DIRECTION,
  INSTITUTE,
  PASSWORD,
  REGION,
  fetch_id,
} from '../common';
import { Input, SelectInput } from 'src/app/shared/models/input.model';
import { map, startWith } from 'rxjs/operators';
import { ConstService } from 'src/app/shared/services/const.service';
import { Region } from 'src/app/shared/models/region.model';
import { Сitizenship } from 'src/app/shared/models/citizenship.model';
import { FullCity } from 'src/app/shared/models/city.model';
import { University } from 'src/app/shared/models/university.model';
import { Course } from 'src/app/shared/models/course.model';
import {
  SignupHiddenModel,
  SignupModel,
} from 'src/app/shared/models/user.model';
import { Direction } from 'src/app/shared/models/direction.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';
import { VacancyService } from 'src/app/shared/services/vacancy.service';

@Component({
  selector: 'app-hidden-password',
  templateUrl: './hidden-password.component.html',
  styleUrls: ['../auth.component.scss', './hidden-password.component.scss'],
})
export class HiddenPasswordComponent implements OnInit {
  constructor(
    private constService: ConstService,
    private authService: AuthService,
    private route: ActivatedRoute,
    private router: Router,
    private _snackBar: MatSnackBar,
    private vacancyService: VacancyService
  ) {}

  title = 'Регистрация';
  subtitle =
    'Пожалуйста, зарегистрируйтесь в системе, чтобы получить доступ к порталу';
  label_password = 'Повторите пароль';
  type_password = 'password2';
  nameButton = 'Зарегистрироваться';
  role_id = 0;
  code = '';

  regions: Region[] = [];
  countries: Сitizenship[] = [];
  cities: FullCity[] = [];
  institutes: University[] = [];
  courses: Course[] = [];
  directions: Direction[] = [];

  form = new FormGroup({
    firstname: new FormControl(null, [Validators.required]),
    lastname: new FormControl(null, [Validators.required]),
    patronymic: new FormControl(null),
    date_of_birth: new FormControl(null, [Validators.required]),
    country: new FormControl(null, [Validators.required]),
    region: new FormControl(null, [Validators.required]),
    city: new FormControl(null, [Validators.required]),
    phone: new FormControl(null, [Validators.required]),
    institute: new FormControl(null, [Validators.required]),
    direction: new FormControl(null, [Validators.required]),
    email: new FormControl(null, [Validators.required, Validators.email]),
    password: new FormControl(null, [
      Validators.required,
      Validators.minLength(8),
    ]),
    password2: new FormControl(null, [
      Validators.required,
      Validators.minLength(8),
      this.createPasswordNotMatchValidator(),
    ]),
  });
  checkbox = new FormControl(null, [Validators.requiredTrue]);
  inputs: Input[] = [
    createEmailInput(this.form),
    createPasswordInput(this.form),
    createPasswordInput(
      this.form,
      (this.label_password = 'Повторите пароль'),
      (this.type_password = 'password2')
    ),
  ];
  inputs2: Input[] = [
    createFieldInput(this.form, 'Фамилия', LASTNAME),
    createFieldInput(this.form, 'Имя', FIRSTNAME),
    createFieldInput(this.form, 'Отчество (при наличии)', PATRONYMIC),
    createPhoneInput(this.form, 'Телефон', PHONE),
  ];
  date = createDateInput(
    this.form,
    'Введите дату рождения',
    'date_of_birth',
    'Дата'
  );

  countryInput: SelectInput = {
    field: COUNTRY,
    type: 'text',
    label: 'Загрузка списка гражданств...',
    formControl: this.form.get(COUNTRY),
  };

  regionInput: SelectInput = {
    field: REGION,
    type: 'text',
    label: 'Загрузка списка регионов...',
    formControl: this.form.get(REGION),
    onClick: (value: any) => {
      this.constService.GetAllCities(value.id).subscribe((cities) => {
        this.cities = cities as FullCity[];
        this.cityInput.values = this.compile_values(CITY, this.cities);
      });
    },
  };
  cityInput: SelectInput = {
    field: CITY,
    type: 'text',
    label: 'Загрузка списка городов...',
    formControl: this.form.get(CITY),
    onClick: (value: any) => {
      this.constService.GetAllUniversities(value.id).subscribe((institutes) => {
        this.institutes = institutes as University[];
        this.instituteInput.values = this.compile_values(
          INSTITUTE,
          this.institutes
        );
      });
    },
  };
  instituteInput: SelectInput = {
    field: INSTITUTE,
    type: 'text',
    label: 'Загрузка списка организаций...',
    formControl: this.form.get(INSTITUTE),
  };
  directionInput: SelectInput = {
    field: DIRECTION,
    type: 'text',
    label: 'Загрузка списка направлений...',
    formControl: this.form.get(DIRECTION),
  };
  regionCityInputs = [this.regionInput, this.cityInput];

  ngOnInit() {
    this.route.queryParams.subscribe((params: Params) => {
      this.role_id = params['role_id'] ? params['role_id'] : 0;
      if (this.isCurator())this.instituteInput.formControl.setValue('t')
      if (this.isMentorHR())this.directionInput.formControl.setValue('t')
      this.code = params['code'] ? params['code'] : '';
    });
    this.constService.GetAllRegions().subscribe((regions) => {
      this.regions = regions as Region[];
      this.regionInput.label = 'Регион';
      this.regionInput.icon = 'keyboard_arrow_down';
      this.regionInput.values = this.compile_values(REGION, this.regions);
    });
    this.constService.GetAllСitizenships().subscribe((countries) => {
      this.countries = countries as Сitizenship[];
      this.countryInput.label = 'Гражданство';
      this.countryInput.icon = 'keyboard_arrow_down';
      this.countryInput.values = this.compile_values(COUNTRY, this.countries);
    });
    this.constService.GetAllCities().subscribe((cities) => {
      this.cities = cities as FullCity[];
      this.cityInput.label = 'Город';
      this.cityInput.icon = 'keyboard_arrow_down';
      this.cityInput.values = this.compile_values(CITY, this.cities);
    });
    this.vacancyService.GetAllTrainingDirections().subscribe((directions) => {
      this.directions = directions as any[];
      this.directionInput.label = 'Направление';
      this.directionInput.icon = 'keyboard_arrow_down';
      this.directionInput.values = this.compile_values(
        DIRECTION,
        this.directions
      );
    });
    this.vacancyService.GetAllOrganizations().subscribe((institutes) => {
      this.institutes = institutes as University[];
      this.instituteInput.label = 'Организация';
      this.instituteInput.icon = 'keyboard_arrow_down';
      this.instituteInput.values = this.compile_values(
        INSTITUTE,
        this.institutes
      );
    });
  }

  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  isCurator() {
    return this.role_id == 2;
  }
  isMentorHR() {
    return this.role_id == 1 || this.role_id == 3;
  }

  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }

  createPasswordNotMatchValidator(): ValidatorFn {
    return (control: AbstractControl): ValidationErrors | null => {
      const value = control.value;
      if (!value) {
        return null;
      }
      return value != this.form.get(PASSWORD)?.value
        ? { passwordNotMatch: true }
        : null;
    };
  }

  onKeyup(field: string) {
    if (field == CITY) {
      let v: any = this.form.get(CITY)?.value;
      if (v && v.length > 0) {
        const { region } = this.form.value;
        this.constService
          .GetAllCities(fetch_id(this.regions, region), v)
          .subscribe((cities) => {
            this.cities = cities as FullCity[];
            this.cityInput.values = this.compile_values(CITY, this.cities);
          });
      }
    }
  }

  signup() {
    const {
      firstname,
      lastname,
      patronymic,
      date_of_birth,
      country,
      city,
      phone,
      institute,
      direction,
      email,
      password,
    } = this.form.value;

    let cityId = fetch_id(this.cities, city);
    let countryId = fetch_id(this.countries, country);
    let instituteId = fetch_id(this.institutes, institute);
    let directionId = fetch_id(this.directions, direction);
    const user = new SignupHiddenModel(
      firstname,
      lastname,
      patronymic,
      date_of_birth,
      phone,
      password,
      email,
      cityId,
      countryId,
      this.code,
      instituteId ? instituteId : undefined,
      directionId ? directionId : undefined
    );
    showMessage(this._snackBar, 'Происходит регистрация...');
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
    this.authService.SignupHidden(user);
  }
}
