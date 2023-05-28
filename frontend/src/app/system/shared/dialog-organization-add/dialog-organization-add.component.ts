import { Component, OnInit, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { OrganizComponent } from '../../organiz/organiz.component';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { TrainingDirection } from 'src/app/shared/models/training_direction.model';
import { Branch } from 'src/app/shared/models/branch.model';
import { TypeOrganization } from 'src/app/shared/models/type_org.model';
import {
  createEmailInput,
  createFieldInput,
  createPhoneInput,
  fetch_id,
  showMessage,
} from 'src/app/auth/common';
import { Input, SelectInput } from 'src/app/shared/models/input.model';
import { ConstService } from 'src/app/shared/services/const.service';
import { Direction } from '@angular/cdk/bidi';
import { map, startWith } from 'rxjs';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { CreateOrganization } from 'src/app/shared/models/organization.model';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-dialog-organization-add',
  templateUrl: './dialog-organization-add.component.html',
  styleUrls: ['./dialog-organization-add.component.scss'],
})
export class DialogOrganizationAddComponent implements OnInit {
  constructor(
    public dialogRef: MatDialogRef<OrganizComponent>,
    private _snackBar: MatSnackBar,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private vacancyService: VacancyService
  ) {}
  industrys: Branch[] = [];
  types: TypeOrganization[] = [];
  directions: TrainingDirection[] = [];

  ngOnInit(): void {
    this.vacancyService.GetAllBranchs().subscribe((industrys) => {
      this.industrys = industrys as Branch[];
      this.industryInput.label = 'Отрасль';
      this.industryInput.icon = 'keyboard_arrow_down';
      this.industryInput.values = this.compile_values(
        'industry',
        this.industrys
      );
    });
    this.vacancyService.GetAllOrganizationTypes().subscribe((types) => {
      this.types = types as TypeOrganization[];
      this.typeInput.label = 'Тип организации';
      this.typeInput.icon = 'keyboard_arrow_down';
      this.typeInput.values = this.compile_values('type', this.types);
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
  add() {
    const {
      name,
      address,
      industry,
      type,
      direction,
      phone,
      email,
      aboutmeControl,
      img,
    } = this.form.value;
    this.vacancyService.GetCoord(address).subscribe((res: any) => {
      let coords =
        res.response.GeoObjectCollection.featureMember[0].GeoObject.Point.pos.split(
          ' '
        );
      let direction_id = fetch_id(this.directions, direction);
      let industry_id = fetch_id(this.industrys, industry);
      let type_id = fetch_id(this.types, type);
      console.log(direction_id, industry_id, type_id);
      let org = new CreateOrganization(
        name,
        aboutmeControl,
        address,
        coords[1] as number,
        coords[0] as number,
        email,
        phone,
        direction_id,
        industry_id,
        type_id,
        img
      );
      this.vacancyService.PostOrg(org).subscribe(
        (res: any) => {
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
    });
  }
  close() {
    this.dialogRef.close();
  }

  form = new FormGroup({
    name: new FormControl(null, [Validators.required]),
    address: new FormControl(null, [Validators.required]),
    industry: new FormControl(null),
    type: new FormControl(null, [Validators.required]),
    direction: new FormControl(null, [Validators.required]),
    phone: new FormControl(null, [Validators.required]),
    email: new FormControl(null, [Validators.required]),
    aboutmeControl: new FormControl(''),
    img: new FormControl(null, [Validators.required]),
  });
  aboutme_inp: Input = {
    type: 'textarea',
    label: '',
    placeholder: 'Описание',
    formControl: this.form.get('aboutmeControl'),
  };
  inputs1: Input[] = [
    createFieldInput(this.form, 'Название', 'name', 'business'),
    createFieldInput(this.form, 'Адрес', 'address', 'business'),
  ];
  inputs2: Input[] = [
    createPhoneInput(this.form, 'Телефон', 'phone'),
    createEmailInput(this.form),
    createFieldInput(this.form, 'Картинка(url)', 'img', 'image'),
  ];
  industryInput: SelectInput = {
    field: 'industry',
    type: 'text',
    label: 'Загрузка списка отраслей...',
    formControl: this.form.get('industry')
  };
  typeInput: SelectInput = {
    field: 'type',
    type: 'text',
    label: 'Загрузка списка типов...',
    formControl: this.form.get('type')
  };
  directionInput: SelectInput = {
    field: 'direction',
    type: 'text',
    label: 'Загрузка списка направлений...',
    formControl: this.form.get('direction'),
  };
}
