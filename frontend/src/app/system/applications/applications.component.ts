import { UserService } from 'src/app/shared/services/user.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';

import { MATCH_COLOR } from 'src/app/shared/consts';
import { SelectInput } from 'src/app/shared/models/input.model';
import { ShortVacancy } from 'src/app/shared/models/vacancy.model';
import { Response } from 'src/app/shared/models/response.model';
import { Selection } from 'src/app/shared/models/selection.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { ResponseStatus } from 'src/app/shared/models/response_status.model';
import { MatDialog } from '@angular/material/dialog';
import { DialogVacationMoreComponent } from '../shared/dialog-vacation-more/dialog-vacation-more.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { get_current_age, showMessage } from 'src/app/auth/common';
import { ImageService } from 'src/app/shared/services/image.service';
import { InternSelection } from 'src/app/shared/models/intern.model';
import { Organization } from 'src/app/shared/models/organization.model';
import { TrainingDirection } from 'src/app/shared/models/training_direction.model';
import { Mentor } from 'src/app/shared/models/mentor.model';

const MATCH_COLOR_STATUS: any = {
  'На рассмотрение': 'yellow',
  Подтверждено: 'green',
  Отказано: 'red',
};

@Component({
  selector: 'app-applications',
  templateUrl: './applications.component.html',
  styleUrls: [
    './applications1.component.scss',
    './applications2.component.scss',
    './applications_curator.component.scss',
    './applications_mentor.component.scss',
    './applications_hr.component.scss',
  ],
})
export class ApplicationsComponent implements OnInit {
  directions: any;
  title_direction = 'Требования';
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
  changeFlag = false;
  statuss: Observable<any> = of([
    { name: 'Подтверждено' },
    { name: 'На рассмотрении' },
    { name: 'Отказано' },
  ]);
  times: any[] = [];
  reqs: any[] = [
    { name: 'Возраст', checked: true, check: this.checkAge },
    { name: 'Гражданство', checked: true, check: this.checkCountry },
    { name: 'Курс', checked: true, check: this.checkCourse },
    { name: 'Опыт работы', checked: true, check: this.checkExp },
  ];
  directionInput: SelectInput = {
    field: 'direction',
    type: 'text',
    label: 'Загрузка списка направлений...',
    formControl: this.form.get('direction'),
  };
  organizationInput: SelectInput = {
    field: 'organization',
    type: 'text',
    label: 'Загрузка списка организаций...',
    formControl: this.form.get('organization'),
  };
  vacancyInput: SelectInput = {
    field: 'vacancy',
    type: 'text',
    label: 'Загрузка списка вакансий...',
    formControl: this.form.get('vacancy'),
  };
  all_timeInput: SelectInput = {
    field: 'all_time',
    type: 'text',
    label: 'За все время',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('all_time'),
  };
  criteriaInput: SelectInput = {
    field: 'criteria',
    type: 'text',
    label: 'Доп. критерии',
    icon: 'keyboard_arrow_down',
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
  mode: any = 'push';
  hasBackdrop: any = false;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private userService: UserService,
    private profileService: ProfileService,
    private vacancyService: VacancyService,
    private _snackBar: MatSnackBar,
    private imageService: ImageService,
    public dialog: MatDialog
  ) {}

  loadSelectionsForMentor(mentor: any) {
    this.userService
      .GetAllSelections(mentor.organization_id)
      .subscribe((res: any) => {
        this.selections = res;
        this.loaded = true;
        if (this.selections.length == 0) this.empty = true;
        else this.empty = false;
      });
  }

  loadResponsesForIntern() {
    this.userService.GetAllResponses().subscribe((response) => {
      this.responses = response as Response[];
      this.loaded = true;
      if (this.responses.length == 0) this.empty = true;
      else this.empty = false;
    });
  }
  loadResponsesForCurator() {
    this.userService.GetAllResponses(true).subscribe((response) => {
      this.responses = (response as Response[]).filter((response) => {
        return response.passed == false;
      });

      this.loaded = true;
      if (this.responses.length == 0) this.empty = true;
      else this.empty = false;
    });
  }
  selectStatus(status: string) {
    if (status == 'Подтверждено') return 'Стажируется';
    if (status == 'Отказано') return 'Отказано на собеседование';
    return status;
  }
  loadResponsesForHR() {
    this.userService.GetAllResponses(true).subscribe((response) => {
      this.responses = (response as Response[]).filter((response) => {
        return (
          response.selection.vacancy.organization_id ==
          this.profileService?.profile?.hr?.organization_id
        );
      });
      this.loaded = true;
      if (this.responses.length == 0) this.empty = true;
      else this.empty = false;
    });
  }
  responses: Response[] = [];
  selections: Selection[] = [];
  statuses: ResponseStatus[] = [];
  organizations: Organization[] = [];
  training_directions: TrainingDirection[] = [];
  vacancies: any[] = [];

  inter: boolean = false;
  work: boolean = false;
  project: boolean = false;
  ngOnInit() {
    ////////////////////////////////////////////////
    this.userService.GetAllResponseStatus().subscribe((statuses) => {
      this.statuses = statuses as ResponseStatus[];
      this.statusInput.label = 'Статус';
      this.statusInput.icon = 'keyboard_arrow_down';
      this.statusInput.values = this.compile_values('status', this.statuses);
    });

    this.vacancyService.GetAllOrganizations().subscribe((organizations) => {
      this.organizations = organizations as Organization[];
      this.organizationInput.label = 'Организация';
      this.organizationInput.icon = 'keyboard_arrow_down';
      this.organizationInput.values = this.compile_values(
        'organization',
        this.organizations
      );
    });

    this.vacancyService.GetAllTrainingDirections().subscribe((ditections) => {
      this.training_directions = ditections as TrainingDirection[];
      this.directionInput.label = 'Направление';
      this.directionInput.icon = 'keyboard_arrow_down';
      this.directionInput.values = this.compile_values(
        'direction',
        this.training_directions
      );
    });

    this.vacancyService.GetAllVacanciesWithFilters().subscribe((vacancies) => {
      this.vacancies = vacancies as any[];
      this.vacancyInput.label = 'Вакансия';
      this.vacancyInput.icon = 'keyboard_arrow_down';
      this.vacancyInput.values = this.compile_values('vacancy', this.vacancies);
    });

    this.vacancyService.GetAllTimes().subscribe((times) => {
      this.times = times as any[];
      this.all_timeInput.label = 'За все время';
      this.all_timeInput.icon = 'keyboard_arrow_down';
      this.all_timeInput.values = this.compile_values('all_time', this.times);
    });

    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.current_role = profile.role.name;
      if (this.profileService.profile?.role.name == 'Стажер')
        this.loadResponsesForIntern();
      if (this.profileService.profile?.role.name == 'Куратор')
        this.loadResponsesForCurator();
      if (this.profileService.profile?.role.name == 'Наставник')
        this.loadSelectionsForMentor(this.profileService.profile.mentor);
      if (this.profileService.profile?.role.name == 'Кадровый специалист')
        this.loadResponsesForHR();
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

  calcAge(birthday: Date | any) {
    return get_current_age(birthday);
  }

  calcBall(selection: Selection) {
    return (
      (selection?.school_val ? selection?.school_val : 0) +
      (selection?.basic_val ? selection?.basic_val : 0) +
      (selection?.interview_val ? selection?.interview_val : 0) +
      45
    );
  }

  getImg(img: any) {
    return this.imageService.CompileURLImg(img);
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

  changeStatusForCurator() {}

  openDialog(vacancy: ShortVacancy) {
    showMessage(this._snackBar, 'Загрузка вакансии...');
    this.vacancyService.GetVacById(vacancy.id).subscribe((res) => {
      const dialogRef = this.dialog.open(DialogVacationMoreComponent, {
        width: '1130px',
        height: '690px',
        data: {
          vacancy: res,
        },
      });
    });
  }

  deleteResponse(response: Response) {
    this.userService.DeleteSelection(response.selection_id).subscribe(
      (res: any) => {
        showMessage(this._snackBar, res.message);
        this.loadResponsesForIntern();
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

  downloadFile(intern: InternSelection | any) {
    let url = this.imageService.validURL(intern.portfolio);
    if (url) window.open(this.imageService.compileUrl(url), '_blank');
    else if (intern.url_portfolio)
      window.open(this.imageService.compileUrl(intern.url_portfolio), '_blank');
    else {
      showMessage(this._snackBar, 'Резюме не загружено пользователем');
    }
  }
  checkAge(intern: InternSelection) {
    let age = get_current_age(intern?.user?.birthdate as any);
    return age < 18 || age > 35;
  }
  checkCountry(intern: InternSelection) {
    return intern?.user?.citizenship_id != 1;
  }
  checkCourse(intern: InternSelection) {
    return intern.course_id < 3;
  }
  checkExp(intern: InternSelection | any) {
    return !intern.work_experience_id;
  }

  aggregCheck(intern: InternSelection) {
    let cnt = 0;
    if (this.checkAge(intern)) cnt += 1;
    if (this.checkCourse(intern)) cnt += 1;
    if (this.checkExp(intern)) cnt += 1;
    if (this.checkCountry(intern)) cnt += 1;
    if (cnt == 0) {
      return '';
    } else if (cnt == 1) {
      return 'я';
    } else {
      return 'й';
    }
  }

  updateValue() {
    this.changeFlag = !this.changeFlag;
  }

  greenLight(card: any) {
    if (this.profileService.profile?.role.name == 'Куратор') {
      this.userService.ChangeStatusResponse(card.id, 2).subscribe(
        (res: any) => {
          this.loadResponsesForCurator();
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
    } else if (this.profileService.profile?.role.name == 'Наставник') {
      this.userService.ChangeSelection(card.id, 3).subscribe(
        (res: any) => {
          this.loadSelectionsForMentor(this.profileService?.profile?.mentor);
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
  redLight(card: any) {
    if (this.profileService.profile?.role.name == 'Куратор') {
      this.userService.ChangeStatusResponse(card.id, 3).subscribe(
        (res: any) => {
          this.loadResponsesForCurator();
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
    } else if (this.profileService.profile?.role.name == 'Наставник') {
      this.userService.ChangeSelection(card.id, 6).subscribe(
        (res: any) => {
          this.loadSelectionsForMentor(this.profileService?.profile?.mentor);
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
}
