import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';
import { SelectInput } from 'src/app/shared/models/input.model';
import { Vacancy } from 'src/app/shared/models/vacancy.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { DialogVacationAddComponent } from '../shared/dialog-vacation-add/dialog-vacation-add.component';
import { MATCH_COLOR } from 'src/app/shared/consts';
import { showMessage } from 'src/app/auth/common';
import { MatSnackBar } from '@angular/material/snack-bar';

let MATCH_COLOR_CARD: any = {
  'На рассмотрении': 'yellow',
  Корректировка: 'correct_hr',
  Опубликовано: 'green',
  Отказано: 'red',
};

@Component({
  selector: 'app-need-for-interns',
  templateUrl: './need-for-interns.component.html',
  styleUrls: [
    './need-for-interns.component1.scss',
    './need-for-interns.component2.scss',
  ],
})
export class NeedForInternsComponent implements OnInit {
  openDialog(): void {
    const dialogRef = this.dialog.open(DialogVacationAddComponent, {
      width: '600px',
      height: '690px',
      data: {},
    });
    dialogRef.afterClosed().subscribe((data) => {
      this.loadVacancyForHR(this.profileService.profile);
    });
  }

  //проверка на нарушение критерия, в дальнейшем заменить в html переменной из бэка булевской
  isFailed = true;
  //ЛОГИКА ИНПУТОВ----------------------------------------------------------
  form = new FormGroup({
    direction: new FormControl(null),
    status: new FormControl(null),
    industry: new FormControl(null),
    organization: new FormControl(null),
    vacancy: new FormControl(null),
    all_time: new FormControl(null),
  });
  //гениальная заглушка
  statuss: Observable<any> = of([
    { name: 'Подтверждено' },
    { name: 'На рассмотрении' },
    { name: 'Отказано' },
  ]);
  directionInput: SelectInput = {
    field: 'direction',
    type: 'text',
    label: 'Направление',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('direction'),
  };
  statusInput: SelectInput = {
    field: 'status',
    type: 'text',
    label: 'Статус',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('status'),
  };

  industryInput: SelectInput = {
    field: 'industry',
    type: 'text',
    label: 'Отрасль',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('industry'),
  };
  organizationInput: SelectInput = {
    field: 'organization',
    type: 'text',
    label: 'Организация',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('organization'),
  };
  vacancyInput: SelectInput = {
    field: 'vacancy',
    type: 'text',
    label: 'Вакансия',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('vacancy'),
  };
  all_timeInput: SelectInput = {
    field: 'all_time',
    type: 'text',
    label: 'За все время',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('all_time'),
  };

  //----------------------------------------------------------
  color: any = 'black';
  current_role: any = null;
  vacancies_selected: any = null;
  vacancies: string[] = ['На стажировку', 'На работу', 'По проектам'];
  mode: any = 'push';
  hasBackdrop: any = false;
  constructor(
    private vacancyService: VacancyService,
    private route: ActivatedRoute,

    private _snackBar: MatSnackBar,
    private router: Router,
    private profileService: ProfileService,
    public dialog: MatDialog
  ) {}
  vacancy_cards: Vacancy[] = [];
  inter: boolean = false;
  work: boolean = false;
  project: boolean = false;

  directions: any[] = [];
  statuses: any[] = [];
  industries: any[] = [];
  organizations: any[] = [];
  vacancys: any[] = [];
  all_times: any[] = [];

  loaded = false;
  empty = false;

  ngOnInit() {
    this.vacancyService.GetAllTrainingDirections().subscribe((directions) => {
      this.directions = directions as any[];
      this.directionInput.values = this.compile_values(
        'direction',
        this.directions
      );
    });

    this.vacancyService.GetAllStatuses().subscribe((statuses) => {
      this.statuses = statuses as any[];
      this.statusInput.values = this.compile_values('status', this.statuses);
    });

    this.vacancyService.GetAllVacanciesNotForIntern().subscribe((vacancies) => {
      this.vacancies = vacancies as any[];
      this.vacancyInput.values = this.compile_values('vacancy', this.vacancies);
    });

    this.vacancyService.GetAllBranchs().subscribe((industries) => {
      this.industries = industries as any[];
      this.industryInput.values = this.compile_values(
        'industry',
        this.industries
      );
    });



    this.vacancyService.GetAllOrganizations().subscribe((organizations) => {
      this.organizations = organizations as any[];
      this.organizationInput.values = this.compile_values(
        'organization',
        this.organizations
      );
    });

    this.vacancyService.GetAllTimes().subscribe((all_times) => {
      this.all_times = all_times as any[];
      this.all_timeInput.values = this.compile_values(
        'all_time',
        this.all_times
      );
    });

    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.current_role = profile.role.name;
      if (this.current_role == 'Кадровый специалист')
        this.loadVacancyForHR(profile);

      if (this.current_role == 'Куратор') this.loadVacancyForCur();
    });
    this.profileService.GetProfile();
    this.route.queryParams.subscribe((params: Params) => {
      if (params['filter'] == 1) {
        this.inter = true;
        this.work = false;
        this.project = false;
      } else if (params['filter'] == 2) {
        this.inter = false;
        this.work = true;
        this.project = false;
      } else if (params['filter'] == 3) {
        this.inter = false;
        this.work = false;
        this.project = true;
      } else {
        this.inter = false;
        this.work = false;
        this.project = false;
      }
    });
  }

  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }

  drop() {
    this.vacancies_selected = null;
  }
  border() {
    return { border: `1px solid ${this.color}` };
  }
  clickFilter(filter: any = null) {
    this.router.navigate(['/system/need-intern'], {
      queryParams: {
        filter: filter,
      },
    });
  }
  colorStatus(card: Vacancy) {
    if (card.status?.name) return MATCH_COLOR_CARD[card.status?.name];
    return '';
  }
  matchColor() {
    return this.color;
  }

  loadVacancyForCur() {
    this.vacancyService
      .GetAllVacanciesNotForIntern()
      .subscribe((items: any) => {
        this.vacancy_cards = items;
        this.loaded = true;
        if (this.vacancy_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
  }
  loadVacancyForHR(profile: any) {
    this.vacancyService
      .GetAllVacanciesNotForIntern(profile.hr.organization_id)
      .subscribe((items: any) => {
        this.vacancy_cards = items;
        this.loaded = true;
        if (this.vacancy_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
  }

  greenLight(card: Vacancy) {
    this.vacancyService.ChangeStatusVacancy(card.id, 3).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
        this.loadVacancyForCur();
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

  redLight(card: Vacancy) {
    this.vacancyService.ChangeStatusVacancy(card.id, 4).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
        this.loadVacancyForCur();
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

  yellowLightHR(card: Vacancy) {
    this.vacancyService.ChangeStatusVacancy(card.id, 1).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
        this.loadVacancyForHR(this.profileService.profile);
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

  yellowLight(card: Vacancy) {
    this.vacancyService.ChangeStatusVacancy(card.id, 2).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
        this.loadVacancyForCur();
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

  deleteVacancy(card: Vacancy) {
    this.vacancyService.DeleteVacancy(card.id).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
        this.loadVacancyForCur();
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
