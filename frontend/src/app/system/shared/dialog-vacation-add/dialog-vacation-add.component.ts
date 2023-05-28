import { ProfileService } from './../../../shared/services/profile.service';
import { CreateVacancy } from './../../../shared/models/vacancy.model';
import { Component, OnInit, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import {
  createDateInput,
  createFieldInput,
  fetch_id,
  showMessage,
} from 'src/app/auth/common';
import { Input, SelectInput } from 'src/app/shared/models/input.model';
import { map, startWith } from 'rxjs';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { Organization } from 'src/app/shared/models/organization.model';
import { MatSnackBar } from '@angular/material/snack-bar';
import { WorkSchedule } from 'src/app/shared/models/work_schedule.model';
import { EmploymentType } from 'src/app/shared/models/employment_type.model';
import { WorkExperience } from 'src/app/shared/models/work_experience.model';

@Component({
  selector: 'app-dialog-vacation-add',
  templateUrl: './dialog-vacation-add.component.html',
  styleUrls: ['./dialog-vacation-add.component.scss'],
})
export class DialogVacationAddComponent implements OnInit {
  constructor(
    private profileService: ProfileService,
    private _snackBar: MatSnackBar,
    public dialogRef: MatDialogRef<DialogVacationAddComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private vacancyService: VacancyService
  ) {}
  work_schedules: WorkSchedule[] = [];
  employment_types: EmploymentType[] = [];
  work_experiences: WorkExperience[] = [];
  skills: string[] = ['Adobe', 'Python', 'Microsoft'];
  empty = true;
  ngOnInit(): void {
    this.vacancyService.GetAllWorkSchedules().subscribe((work_schedules) => {
      this.work_schedules = work_schedules as WorkSchedule[];
      this.workScheduleInput.label = 'График работы';
      this.workScheduleInput.icon = 'keyboard_arrow_down';
      this.workScheduleInput.values = this.compile_values(
        'work_schedule',
        this.work_schedules
      );
    });

    this.vacancyService
      .GetAllEmploymentTypes()
      .subscribe((employment_types) => {
        this.employment_types = employment_types as Organization[];
        this.employmentTypeInput.label = 'Тип занятостей';
        this.employmentTypeInput.icon = 'keyboard_arrow_down';
        this.employmentTypeInput.values = this.compile_values(
          'employment_type',
          this.employment_types
        );
      });
    this.vacancyService
      .GetAllWorkExperiencies()
      .subscribe((work_experiences) => {
        this.work_experiences = work_experiences as WorkExperience[];
        this.workExpInput.label = 'Опыт работы';
        this.workExpInput.icon = 'keyboard_arrow_down';
        this.workExpInput.values = this.compile_values(
          'work_experience',
          this.work_experiences
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

  processSplitLine(line: string) {
    const regExp = /\*|#|-|.$/g;
    return line
      .replace(regExp, '')
      .split(';\n')
      .map((line) => {
        return line.trimStart().trimEnd();
      });
  }
  add() {
    const {
      name,
      work_schedule,
      employment_type,
      work_experience,
      min_salary,
      max_salary,
      date_begin,
      aboutmeControl,
      date_end,
      cnt_intern,
      condControl,
      reqControl,
      dutyControl,
    } = this.form.value;
    let conditions = this.processSplitLine(condControl as string);
    let requirements = this.processSplitLine(reqControl as string);
    let duties = this.processSplitLine(dutyControl as string);

    let work_experience_id = fetch_id(this.work_experiences, work_experience);
    let work_schedule_id = fetch_id(this.work_schedules, work_schedule);
    let employment_type_id = fetch_id(this.employment_types, employment_type);
    let vac = new CreateVacancy(
      name,
      aboutmeControl,
      min_salary,
      max_salary,
      new Date(`${date_begin}`).getTime(),
      new Date(`${date_end}`).getTime(),
      work_schedule_id,
      this.profileService?.profile?.hr?.organization_id,
      employment_type_id,
      this.profileService.profile?.id,
      work_experience_id,
      cnt_intern,
      conditions,
      requirements,
      duties,
      this.skills
    );
    let s = this.vacancyService.PostVac(vac).subscribe(
      (res: any) => {
        s.unsubscribe();
        showMessage(this._snackBar, res.message);
        this.close();
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
  close() {
    this.dialogRef.close();
  }

  form = new FormGroup({
    name: new FormControl(null, [Validators.required]),
    work_schedule: new FormControl(null, [Validators.required]),
    employment_type: new FormControl(null, [Validators.required]),
    work_experience: new FormControl(null, [Validators.required]),
    min_salary: new FormControl(null, [Validators.required]),
    max_salary: new FormControl(null, [Validators.required]),
    date_begin: new FormControl(null, [Validators.required]),
    cnt_intern: new FormControl(null, [Validators.required]),
    aboutmeControl: new FormControl(''),
    condControl: new FormControl(''),
    reqControl: new FormControl(''),
    dutyControl: new FormControl(''),
    date_end: new FormControl(null, [Validators.required]),
  });
  textareas: Input[] = [
    {
      type: 'textarea',
      label: '',
      placeholder: 'Описание',
      formControl: this.form.get('aboutmeControl'),
    },
    {
      type: 'textarea',
      label: '',
      placeholder:
        'Условие работы 1;\nУсловие работы 2;\nУсловие работы 3;\n...',
      formControl: this.form.get('condControl'),
    },
    {
      type: 'textarea',
      label: '',
      placeholder:
        'Требование к стажеру 1;\nТребованик к стажеру 2;\nТребованик к стажеру 3;\n...',
      formControl: this.form.get('reqControl'),
    },
    {
      type: 'textarea',
      label: '',
      placeholder:
        'Обязанность стажера 1;\nОбязанность стажера 2;\nОбязанность стажера 3;\n...',
      formControl: this.form.get('dutyControl'),
    },
  ];
  inputs1: Input[] = [
    createFieldInput(this.form, 'Название', 'name', 'local_mall'),
  ];
  inputs2: Input[] = [
    createFieldInput(
      this.form,
      'Мин. зарплата',
      'min_salary',
      'trending_down',
      '',
      'number'
    ),
    createFieldInput(
      this.form,
      'Макс. зарплата',
      'max_salary',
      'trending_up',
      '',
      'number'
    ),
    createFieldInput(
      this.form,
      'Количество стажеров',
      'cnt_intern',
      'group',
      '',
      'number'
    ),
  ];
  inputDate1: Input = createDateInput(
    this.form,
    'Дата начала',
    'date_begin',
    'Дата',
    ''
  );
  inputDate2: Input = createDateInput(
    this.form,
    'Дата окончания',
    'date_end',
    'Дата',
    ''
  );
  workScheduleInput: SelectInput = {
    field: 'work_schedule',
    type: 'text',
    label: 'Загрузка графиков работы...',
    formControl: this.form.get('work_schedule'),
  };

  employmentTypeInput: SelectInput = {
    field: 'employment_type',
    type: 'text',
    label: 'Загрузка типов занятостей...',
    formControl: this.form.get('employment_type'),
  };
  workExpInput: SelectInput = {
    field: 'work_experience',
    type: 'text',
    label: 'Загрузка опытов работ...',
    formControl: this.form.get('work_experience'),
  };

  predict() {
    const { aboutmeControl } = this.form.value;
    showMessage(this._snackBar, 'Навыки подбираются...');
    if (aboutmeControl) {
      this.vacancyService
        .PostPredictAISkills(aboutmeControl)
        .subscribe((results: any) => {
          this.skills = results.tag;
          this.empty = false;
        });
    } else {
      showMessage(this._snackBar, 'Опишите вакансию');
    }
  }

  removeSkill(skill: string) {
    this.skills = this.skills.filter((sk) => sk != skill);
  }
}
