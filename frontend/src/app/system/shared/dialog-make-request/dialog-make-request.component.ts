import { Component, OnInit, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Input, SelectInput } from 'src/app/shared/models/input.model';
import { OrganizComponent } from '../../organiz/organiz.component';
import { map, startWith } from 'rxjs';
import { createDateInput, showMessage } from 'src/app/auth/common';
import { MatSnackBar } from '@angular/material/snack-bar';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-dialog-make-request',
  templateUrl: './dialog-make-request.component.html',
  styleUrls: ['./dialog-make-request.component.scss']
})
export class DialogMakeRequestComponent implements OnInit{
  constructor(
    private userService: UserService,
    public dialogRef: MatDialogRef<OrganizComponent>,
    private _snackBar: MatSnackBar,

    @Inject(MAT_DIALOG_DATA) public data: any
  ) {}
  ngOnInit(): void {
    this.marks = [
      { name: 'УО - Учебный отпуск' },
      { name: 'Б - Больничный' },
      { name: 'А - Отпуск за свой счёт' },
    ];
    this.markInput.label = 'Тип запроса';
    this.markInput.icon = 'keyboard_arrow_down';
    this.markInput.values = this.compile_values('mark', this.marks);
  }
  color: any = '#05BFA8';
  form = new FormGroup({
    mark: new FormControl(null, [Validators.required]),
    aboutmeControl: new FormControl('Комментарий'),
    date_of_birth: new FormControl(null, [Validators.required]),
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
  aboutme_inp: Input = {
    type: 'textarea',
    placeholder: '',
    formControl: this.form.get('aboutmeControl'),
  };
  add() {
    
  }
  date = createDateInput(
    this.form,
    'Выбрать дату',
    'date_of_birth',
    'Дата'
  );
}
