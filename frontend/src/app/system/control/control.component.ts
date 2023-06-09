import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, FormsModule } from '@angular/forms';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';
import { createDateInput, fetch_id, showMessage } from 'src/app/auth/common';
import { MATCH_COLOR } from 'src/app/shared/consts';
import { Input, SelectInput } from 'src/app/shared/models/input.model';
import { Vacancy } from 'src/app/shared/models/vacancy.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { UserService } from 'src/app/shared/services/user.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { HttpResponse } from '@angular/common/http';
export interface PeriodicElement {
  vacancy: string;
  intern: string;
  week: number;
  day: number;
  status: boolean;
}
const ELEMENT_DATA: PeriodicElement[] = [];
@Component({
  selector: 'app-control',
  templateUrl: './control.component.html',
  styleUrls: ['./control1.component.scss', './control2.component.scss', './control3.component.scss'],
})
export class ControlComponent implements OnInit {
  @ViewChild(MatSort) sort = new MatSort();
  //ЛОГИКА ИНПУТОВ----------------------------------------------------------
  form = new FormGroup({
    vacancy: new FormControl(null),
    intern: new FormControl(null),
    status: new FormControl(null),
    date: new FormControl(null),
    hour: new FormControl(null),
  });
  //гениальная заглушка
  statuss: Observable<any> = of([
    { name: 'Присутствовал' },
    { name: 'Не присутствовал' },
  ]);
  vacancyInput: SelectInput = {
    field: 'vacancy',
    type: 'text',
    label: 'Загрузка списка вакансий...',
    formControl: this.form.get('vacancy'),
  };
  internInput: SelectInput = {
    field: 'intern',
    type: 'text',
    label: 'Загрузка списка стажеров...',
    formControl: this.form.get('intern'),
  };
  inputDate: Input = createDateInput(this.form, 'Дата', 'date', 'Дата', '');
  hourInput: SelectInput = {
    field: 'hour',
    type: 'text',
    label: 'Кол-во часов',
    formControl: this.form.get('hour'),
  };
  statusInput: SelectInput = {
    field: 'status',
    type: 'text',
    label: 'Статус',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('status'),
  };
  //----------------------------------------------------------
  color: any = 'black';
  current_role: any = null;
  vacancies_selected: any = null;
  mode: any = 'push';
  hasBackdrop: any = false;
  constructor(
    private vacancyService: VacancyService,
    private route: ActivatedRoute,
    private router: Router,
    private _snackBar: MatSnackBar,
    private profileService: ProfileService,
    private userService: UserService
  ) {}
  vacancy_cards: Vacancy[] = [];
  inter: boolean = true;
  work: boolean = false;
  project: boolean = false;
  all_selects: any = [];
  ngOnInit(): void {
    this.vacancyService.GetAllStatusesForMentors().subscribe((statuses) => {
      this.statuses = statuses as any[];
      this.statusInput.values = this.compile_values('status', this.statuses);
    });

    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      this.loadPrence();
      this.vacancyService
        .GetAllVacanciesWithFilters([profile?.mentor?.organization_id])
        .subscribe((vacancies) => {
          this.vacancies = vacancies as any[];
          this.vacancyInput.label = 'Вакансия';
          (this.vacancyInput.icon = 'keyboard_arrow_down'),
            (this.vacancyInput.values = this.compile_values(
              'vacancy',
              this.vacancies
            ));
        });

      this.userService
        .GetSelectionToStat(
          this.profileService?.profile?.mentor?.organization_id
        )
        .subscribe((selects: any) => {
          this.all_selects = selects;
          this.interns = selects
            .filter((select: any) => {
              return select.stage_id == 3;
            })
            .map((select: any) => {
              return {
                name: this.fullName(select.intern.user),
                id: select.intern_id,
              };
            });
          this.internInput.label = 'Стажер';
          (this.internInput.icon = 'keyboard_arrow_down'),
            (this.internInput.values = this.compile_values(
              'intern',
              this.interns
            ));
        });
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.current_role = profile.role.name;
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
      }
    });
  }

  vacancies: any[] = [];
  interns: any[] = [];
  weeks: any[] = [];
  days: any[] = [];
  statuses: any[] = [];

  displayedColumns: string[] = ['vacancy', 'intern', 'day', 'week', 'status'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);
  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  drop() {
    this.vacancies_selected = null;
  }

  border() {
    return { border: `1px solid ${this.color}` };
  }
  clickFilter(filter: any = null) {
    this.router.navigate(['/system/control'], {
      queryParams: {
        filter: filter,
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

  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }

  endInterning() {
    if (this.selectInt) {
      this.userService
        .EndInterning(
          (this.all_selects as Array<any>).filter((select: any) => {
            return select.intern_id == this.selectInt.id;
          })[0].id
        )
        .subscribe(
          (res: any) => {
            showMessage(this._snackBar, res.message);
            this.loadPrence();
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
      showMessage(this._snackBar, 'Выберите стажера');
    }
  }

  addPresence() {
    const { vacancy, status, date, hour } = this.form.value;
    let vacancy_id = fetch_id(this.vacancies, vacancy);
    if (vacancy_id && this.selectInt?.id) {
      let presence = {
        vacancy_id: vacancy_id,
        intern_id: this.selectInt.id,
        date: new Date(`${date}`).getTime(),
        status: status,
        hour: hour ? hour : 0,
      };

      this.userService.PostPresence(presence).subscribe(
        (res: any) => {
          showMessage(this._snackBar, res.message);
          this.loadPrence();
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

  fullName(user: any) {
    return `${user.lastname} ${user.firstname} ${user.patronymic}`;
  }

  selectIntern(user: any) {
    this.selectInt = user;
  }
  precences: any;
  loadPrence() {
    this.userService.GetPresence().subscribe((presence: any) => {
      this.precences = presence.map((pre: any) => {
        return {
          vacancy: pre.vacancy.name,
          intern: this.fullName(pre.intern.user),
          date: pre.date,
          hour: pre.hour,
          status: pre.status,
        };
      });
      this.dataSource = new MatTableDataSource(
        presence.map((pre: any) => {
          return {
            vacancy: pre.vacancy.name,
            intern: this.fullName(pre.intern.user),
            day: pre.date,
            week: pre.hour,
            status: pre.status,
          };
        })
      );
    });
  }
  checkStr(status:string){
    return status.indexOf('тпуск') !=-1
  }
  downloadLink() {
    this.userService
      .downloadLink(this.precences)
      .subscribe((resp: HttpResponse<Blob>) => {
        // console.log(resp.headers.get('content-disposition'));
        let data = resp.body;
        const url = window.URL.createObjectURL(resp.body as any);
        const a = document.createElement('a');
        a.href = url;
        a.download = 'statistic.xlsx';
        a.click();
        window.URL.revokeObjectURL(url);
      });
  }
  selectInt: any = null;
  responses: any = [1,2,3]
  isCheckbox: boolean = false;
  clickCheckbox(){
    if (this.isCheckbox){
      this.isCheckbox=false
    }
    else{
      this.isCheckbox=true
    }

  }
}
