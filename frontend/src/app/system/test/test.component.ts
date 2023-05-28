import { UserService } from 'src/app/shared/services/user.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';
import { MATCH_COLOR } from 'src/app/shared/consts';
import { SelectInput } from 'src/app/shared/models/input.model';
import { Vacancy } from 'src/app/shared/models/vacancy.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { fetch_id, showMessage } from 'src/app/auth/common';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ImageService } from 'src/app/shared/services/image.service';
import { CreateTask } from 'src/app/shared/models/task.model';
import { TrainingDirection } from 'src/app/shared/models/training_direction.model';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
export interface PeriodicElement {
  candidate_fio: string;
  ball: number;
  status: boolean;
}
const ELEMENT_DATA: PeriodicElement[] = [];

@Component({
  selector: 'app-test',
  templateUrl: './test.component.html',
  styleUrls: ['./test1.component.scss', './test2.component.scss'],
})
export class TestComponent implements OnInit {
  @ViewChild(MatSort) sort = new MatSort();
  //ЛОГИКА ИНПУТОВ----------------------------------------------------------
  form = new FormGroup({
    vacancy: new FormControl(null),
    direction: new FormControl(null),
  });
  directions: TrainingDirection[] = [];
  vacancies: Vacancy[] = [];

  url = '';

  vacancyInput: SelectInput = {
    field: 'vacancy',
    type: 'text',
    label: 'Загрузка списка вакансий...',
    formControl: this.form.get('vacancy'),
  };
  directionInput: SelectInput = {
    field: 'direction',
    type: 'text',
    label: 'Загрузка списка направлений...',
    formControl: this.form.get('direction'),
  };
  //----------------------------------------------------------
  displayedColumns: string[] = ['candidate_fio', 'ball', 'status'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);
  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  color: any = 'black';
  current_role: any = null;
  mode: any = 'push';
  hasBackdrop: any = false;
  constructor(
    private route: ActivatedRoute,
    private imageService: ImageService,
    private userService: UserService,
    private vacancyService: VacancyService,
    private router: Router,
    private _snackBar: MatSnackBar,
    private profileService: ProfileService
  ) {}
  vacancy_cards: Vacancy[] = [];
  inter: boolean = true;
  work: boolean = false;
  project: boolean = false;
  // [
  //   {
  //     candidate_fio: 'ffffffffffffffffffffffffffffffffffffffffffffff',
  //     ball: 1000,
  //     status: true,
  //   },
  //   {
  //     candidate_fio: 'ffffffffffffffffffffffffffffffffffffffffffffff',
  //     ball: 1000,
  //     status: false,
  //   },
  // ]
  filterByVac() {}

  ngOnInit() {
    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.current_role = profile.role.name;
      this.userService
        .GetSelectionToStat(
          this.profileService?.profile?.mentor?.organization_id
        )
        .subscribe((res: any) => {
          this.dataSource = new MatTableDataSource(
            res.map((data: any) => {
              return {
                candidate_fio: `${data.intern.user.lastname} ${data.intern.user.firstname} ${data.intern.user.patronymic}`,
                ball: data.value,
                stage_id: data.stage_id,
              };
            })
          );
        });

      if (this.profileService.profile?.mentor?.organization_id)
        this.vacancyService
          .GetAllVacanciesWithFilters([
            this.profileService.profile?.mentor?.organization_id,
          ])
          .subscribe((vacancies) => {
            this.vacancies = vacancies as Vacancy[];
            this.vacancyInput.label = 'Вакансия';
            this.vacancyInput.icon = 'keyboard_arrow_down';
            this.vacancyInput.values = this.compile_values(
              'vacancy',
              this.vacancies
            );
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
      }
    });

    this.vacancyService.GetAllTrainingDirections().subscribe((directions) => {
      this.directions = directions as TrainingDirection[];
      this.directionInput.label = 'Направление';
      this.directionInput.icon = 'keyboard_arrow_down';
      this.directionInput.values = this.compile_values(
        'direction',
        this.directions
      );
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
  border() {
    return { border: `1px solid ${this.color}` };
  }
  clickFilter(filter: any = null) {
    this.router.navigate(['/system/test'], {
      queryParams: {
        filter: filter,
      },
    });
  }
  matchColor() {
    return this.color;
  }

  addTest() {
    const { vacancy, direction } = this.form.value;
    let direction_id = fetch_id(this.directions, direction);
    let vacancy_id = fetch_id(this.vacancies, vacancy);

    if (this.profileService?.profile?.id) {
      let test = new CreateTask(
        vacancy_id,
        direction_id,
        this.url,
        this.profileService?.profile?.id
      );
      let s = this.userService.PostTask(test).subscribe(
        (res: any) => {
          s.unsubscribe();
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
  onOpenFileDialog(id: string) {
    document.getElementById(id)?.click();
  }

  filePortChange(event: any) {
    showMessage(this._snackBar, 'Файл загружается...');
    let fileList: FileList = event.target.files;
    if (!fileList.length) {
      return;
    }
    let file = fileList[0];
    let s = this.imageService.FileUnloaded.subscribe(
      (data) => {
        s.unsubscribe();
        showMessage(this._snackBar, 'Файл загружен');
        this.url = data;
      },
      (err) => {
        if (Array.isArray(err.error.detail)) {
          showMessage(this._snackBar, err.error.detail[0].msg);
        } else if (err.error.detail) {
          showMessage(this._snackBar, err.error.detail);
        }
      }
    );
    this.imageService.UnloadFile(file, file.name, false, 'interview');
  }
}
