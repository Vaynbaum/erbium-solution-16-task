import { UserService } from 'src/app/shared/services/user.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';

import { MATCH_COLOR } from 'src/app/shared/consts';
import { SelectInput } from 'src/app/shared/models/input.model';
import { ShortVacancy } from 'src/app/shared/models/vacancy.model';
import { Response } from 'src/app/shared/models/response.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { ResponseStatus } from 'src/app/shared/models/response_status.model';
import { MatSnackBar } from '@angular/material/snack-bar';
import { showMessage } from 'src/app/auth/common';

const MATCH_COLOR_STATUS: any = {
  'На рассмотрение': 'yellow',
  Подтверждено: 'green',
  Отказано: 'red',
};
@Component({
  selector: 'app-selection-curator',
  templateUrl: './selection-curator.component.html',
  styleUrls: ['./selection-curator.component.scss', 'selection-curator2.component.scss']
})
export class SelectionCuratorComponent implements OnInit{
  //ЛОГИКА ИНПУТОВ----------------------------------------------------------
  loaded = false;
  empty = false;
  form = new FormGroup({
    direction: new FormControl(null),
    organization: new FormControl(null),
    vacancy: new FormControl(null),
    all_time: new FormControl(null),
    requires: new FormControl(null),
    criteria: new FormControl(null),
    status: new FormControl(null),
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
    values: this.statuss,
    formControl: this.form.get('direction'),
  };
  organizationInput: SelectInput = {
    field: 'organization',
    type: 'text',
    label: 'Организация',
    icon: 'keyboard_arrow_down',
    values: this.statuss,
    formControl: this.form.get('organization'),
  };
  vacancyInput: SelectInput = {
    field: 'vacancy',
    type: 'text',
    label: 'Вакансия',
    icon: 'keyboard_arrow_down',
    values: this.statuss,
    formControl: this.form.get('vacancy'),
  };
  all_timeInput: SelectInput = {
    field: 'all_time',
    type: 'text',
    label: 'За все время',
    icon: 'keyboard_arrow_down',
    values: this.statuss,
    formControl: this.form.get('all_time'),
  };
  criteriaInput: SelectInput = {
    field: 'criteria',
    type: 'text',
    label: 'Доп. критерии',
    icon: 'keyboard_arrow_down',
    values: this.statuss,
    formControl: this.form.get('criteria'),
  };
  statusInput: SelectInput = {
    field: 'status',
    type: 'text',
    label: 'Загрузка списка статусов...',
    formControl: this.form.get('status'),
  };
  //----------------------------------------------------------
  color: any = 'black';
  current_role: any = null;
  vacancies_selected: any = null;
  vacancies: string[] = ['На стажировку', 'На работу', 'По проектам'];
  mode: any = 'push';
  hasBackdrop: any = false;
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private userService: UserService,
    private profileService: ProfileService,
    private vacancyService: VacancyService,
    private _snackBar: MatSnackBar,
  ) {}
  responses: Response[] = [];
  statuses: ResponseStatus[] = [];
  inter: boolean = false;
  work: boolean = false;
  project: boolean = false;
  ngOnInit() {
    this.userService.GetAllResponseStatus().subscribe((statuses) => {
      this.statuses = statuses as ResponseStatus[];
      this.statusInput.label = 'Статус';
      this.statusInput.icon = 'keyboard_arrow_down';
      this.statusInput.values = this.compile_values('status', this.statuses);
    });
    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.current_role = profile.role.name;

      this.userService.GetAllResponses().subscribe((response) => {
        this.responses = response as Response[];
        this.loaded = true;
        if (this.responses.length == 0) this.empty = true;
        else this.empty = false;
      });
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

  drop() {
    this.vacancies_selected = null;
  }

  border() {
    return { border: `1px solid ${this.color}` };
  }

  clickFilter(filter: any = null) {
    this.router.navigate(['/system/applications'], {
      queryParams: {
        filter: filter,
      },
    });
  }

  gotoTesting() {
    this.router.navigate(['/system/selection'], {
      queryParams: {
        testing: true,
      },
    });
  }

  matchColor() {
    return this.color;
  }

  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  deleteResponse(response: Response) {
    this.userService.DeleteSelection(response.selection_id).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
        this.userService.GetAllResponses().subscribe((response) => {
          this.responses = response as Response[];
          if (this.responses.length == 0) this.empty = true;
          else this.empty = false;
        });
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

  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }

  isFailedStatus(status: ResponseStatus) {
    return status.name === 'Отказано';
  }

  selectColor(status: ResponseStatus) {
    return MATCH_COLOR_STATUS[status.name];
  }
}

