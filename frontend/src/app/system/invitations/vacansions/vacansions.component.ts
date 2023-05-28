import { Vacancy } from './../../../shared/models/vacancy.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import {
  Component,
  ViewChild,
  OnInit,
  HostListener,
  Input,
} from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatAccordion } from '@angular/material/expansion';
import { createFieldInput, showMessage } from 'src/app/auth/common';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { DialogVacationMoreComponent } from '../../shared/dialog-vacation-more/dialog-vacation-more.component';
import { MatSnackBar } from '@angular/material/snack-bar';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-vacansions',
  templateUrl: './vacansions.component.html',
  styleUrls: ['./vacansions.component.scss'],
})
export class VacansionsComponent implements OnInit {
  constructor(
    private vacancyService: VacancyService,
    private profileService: ProfileService,
    public dialog: MatDialog,
    private _snackBar: MatSnackBar,
    private userService: UserService
  ) {}
  empty = false;
  vacancy_cards: any[] = [];
  branchs: any;
  b_l = false;
  directions: any;
  b_d = false;
  organizations: any;
  b_o = false;
  work_experiences: any;
  b_w = false;
  employment_types: any;
  b_e = false;
  work_schedules: any;
  b_ws = false;
  title_direction = 'Направление';
  title_work_experience = 'Опыт работы';
  title_branch = 'Отрасль';
  title_organization = 'Организация';
  title_salary = 'Зарплата';
  title_employment_type = 'Тип занятости';
  title_work_schedule = 'График работы';
  work_experience_selected: any = null;
  value_salary: any = 0;
  loadedVac = false;
  isMobile = false;

  @Input()
  organization_id: any;

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

  ngOnInit(): void {
    this.isMobile = window.innerWidth < 768;

    this.vacancyService
      .GetAllVacanciesWithFilters(
        this.organization_id ? [this.organization_id] : []
      )
      .subscribe((response: any) => {
        this.vacancy_cards = response;
        this.loadedVac = true;
        if (this.vacancy_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
    this.vacancyService.GetAllBranchs().subscribe((branchs: any) => {
      this.branchs = branchs;
      let res = this.branchs.filter((b: any) => {
        return b.id == this.profileService?.profile?.intern?.branch_id;
      });
      if (res.length > 0) res[0].checked = true;
      this.b_l = true;
    });
    this.vacancyService
      .GetAllOrganizations()
      .subscribe((organizations: any) => {
        this.organizations = organizations;
        let res = this.organizations.filter((org: any) => {
          return (
            org.id == this.profileService?.profile?.intern?.organization_id
          );
        });
        if (res.length > 0) res[0].checked = true;
        this.b_o = true;
      });
    this.vacancyService
      .GetAllWorkSchedules()
      .subscribe((work_schedules: any) => {
        this.work_schedules = work_schedules;
        this.b_ws = true;
      });
    this.vacancyService
      .GetAllWorkExperiencies()
      .subscribe((work_experiences: any) => {
        this.work_experiences = work_experiences;
        let res = this.work_experiences.filter((exp: any) => {
          return (
            exp.id == this.profileService?.profile?.intern?.work_experience_id
          );
        });
        if (res.length > 0) this.work_experience_selected = res[0].id;
        this.b_w = true;
      });
    this.vacancyService
      .GetAllEmploymentTypes()
      .subscribe((employment_types: any) => {
        this.employment_types = employment_types;
        this.b_e = true;
      });
    this.vacancyService
      .GetAllTrainingDirections()
      .subscribe((directions: any) => {
        this.directions = directions;
        let res = this.directions.filter((d: any) => {
          return (
            d.id == this.profileService?.profile?.intern?.training_direction_id
          );
        });
        if (res.length > 0) res[0].checked = true;
        this.b_d = true;
      });
  }

  mode: any = 'push';
  hasBackdrop: any = false;
  form = new FormGroup({
    search: new FormControl(null),
  });
  //@ts-ignore
  @ViewChild(MatAccordion) accordion: MatAccordion;

  search_type = createFieldInput(this.form, 'Поиск', 'search', 'search');

  formatLabel(value: number): string {
    if (value >= 1000) {
      return `${Math.round(value / 1000)}тыс.`;
    }
    return `${value}`;
  }

  pr(items: any[]) {
    return items
      .filter((item: any) => {
        return item.checked;
      })
      .map((i: any) => {
        return i.id;
      });
  }

  dr(items: any[]) {
    items.forEach((item: any) => {
      item.checked = false;
    });
  }

  defaultFilters() {}

  onKeyup() {
    this.vacancyService
      .GetAllVacanciesWithFilters(
        this.pr(this.organizations),
        this.work_experience_selected,
        this.pr(this.employment_types),
        this.pr(this.work_schedules),
        this.pr(this.branchs),
        this.pr(this.directions),

        this.value_salary,
        this.form.get('search')?.value
      )
      .subscribe((items: any) => {
        this.vacancy_cards = items;
        if (this.vacancy_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.isMobile = event.target.innerWidth < 768;
  }

  submit() {
    this.vacancyService
      .GetAllVacanciesWithFilters(
        this.pr(this.organizations),
        this.work_experience_selected,
        this.pr(this.employment_types),
        this.pr(this.work_schedules),
        this.pr(this.branchs),
        this.pr(this.directions),

        this.value_salary
      )
      .subscribe((items: any) => {
        this.vacancy_cards = items;
        if (this.vacancy_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
  }

  drop() {
    this.value_salary = 0;
    this.work_experience_selected = null;
    this.dr(this.employment_types);
    this.dr(this.work_schedules);
    this.dr(this.branchs);
    this.dr(this.directions);
    this.dr(this.organizations);
  }

  openDialog(index: any) {
    const dialogRef = this.dialog.open(DialogVacationMoreComponent, {
      width: '1130px',
      height: '690px',
      data: {
        vacancy: this.vacancy_cards[index],
      },
    });
  }
}
