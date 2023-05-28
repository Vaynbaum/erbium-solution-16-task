import { UserService } from 'src/app/shared/services/user.service';
import { Component, OnInit, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { HeaderComponent } from '../header/header.component';
import { SelectInput } from 'src/app/shared/models/input.model';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { map, startWith } from 'rxjs';
import { fetch_id, showMessage } from 'src/app/auth/common';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-dialog-mailer-add',
  templateUrl: './dialog-mailer-add.component.html',
  styleUrls: ['./dialog-mailer-add.component.scss'],
})
export class DialogMailerAddComponent implements OnInit {
  constructor(
    public dialogRef: MatDialogRef<HeaderComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private _snackBar: MatSnackBar,
    private userService: UserService,
    private vacancyService: VacancyService
  ) {}
  statuses: any[] = [];
  ngOnInit(): void {
    this.vacancyService.GetAllRoles().subscribe((statuses) => {
      this.statuses = statuses as any[];
      this.statusInput.values = this.compile_values('status', this.statuses);
    });
  }
  color: any = '#B30A3F';
  form = new FormGroup({
    week: new FormControl(null, [Validators.required, Validators.email]),
    status: new FormControl(null, [Validators.required]),
  });
  border() {
    return { border: `1px solid ${this.color}` };
  }
  close() {
    this.dialogRef.close();
  }
  statusInput: SelectInput = {
    field: 'status',
    type: 'text',
    label: 'Роль',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('status'),
  };
  weekInput: SelectInput = {
    field: 'week',
    type: 'text',
    label: 'Email',
    icon: 'email',
    formControl: this.form.get('week'),
  };
  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }
  add() {
    const { week, status } = this.form.value;
    let status_id = fetch_id(this.statuses, status);
    this.userService.GetInv(week, status_id).subscribe(
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
  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }
}
