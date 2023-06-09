import { Component, OnInit, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Input, SelectInput } from 'src/app/shared/models/input.model';
import { OrganizComponent } from '../../organiz/organiz.component';
import { map, startWith } from 'rxjs';
import { showMessage } from 'src/app/auth/common';
import { MatSnackBar } from '@angular/material/snack-bar';
import { UserService } from 'src/app/shared/services/user.service';

export interface DialogData {
  id: number;
  org_id: number;
  name_nast: string;
}

@Component({
  selector: 'app-dialog-info-intership-add',
  templateUrl: './dialog-info-intership-add.component.html',
  styleUrls: ['./dialog-info-intership-add.component.scss'],
})
export class DialogInfoIntershipAddComponent implements OnInit {
  constructor(
    private userService: UserService,
    public dialogRef: MatDialogRef<OrganizComponent>,
    private _snackBar: MatSnackBar,

    @Inject(MAT_DIALOG_DATA) public data: DialogData
  ) {}
  ngOnInit(): void {
    this.marks = [
      { name: '5' },
      { name: '4' },
      { name: '3' },
      { name: '2' },
      { name: '1' },
    ];
    this.markInput.label = 'Оценка';
    this.markInput.icon = 'keyboard_arrow_down';
    this.markInput.values = this.compile_values('mark', this.marks);
  }
  color: any = '#05BFA8';
  form = new FormGroup({
    name_nast: new FormControl(this.data.name_nast, [Validators.required]),
    mark: new FormControl(null, [Validators.required]),
    aboutmeControl: new FormControl(''),
  });
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
  marks: any;
  markInput: SelectInput = {
    field: 'mark',
    type: 'text',
    label: 'Загрузка',
    formControl: this.form.get('mark'),
    onClick: (value: any) => {
      this.markInput.values = this.compile_values('mark', this.marks);
    },
  };
  nameNastInp: SelectInput = {
    field: 'name_nast',
    type: 'text',
    label: '',
    formControl: this.form.get('name_nast'),
  };
  aboutme_inp: Input = {
    type: 'textarea',
    label: 'Отзыв',
    placeholder: '',
    formControl: this.form.get('aboutmeControl'),
  };
  add() {
    if (this.form.valid) {
      const { mark, aboutmeControl } = this.form.value;
      this.userService
        .AddReview({
          text: aboutmeControl,
          mark: mark,
          mentor_id: this.data.id,
          organization_id: this.data.org_id,
        })
        .subscribe(
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
    } else {
      showMessage(this._snackBar, 'Заполните поля');
    }
  }
}
