import { Component, OnInit, Inject } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { HeaderComponent } from '../header/header.component';
import { SelectInput } from 'src/app/shared/models/input.model';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { map, startWith } from 'rxjs';

@Component({
  selector: 'app-dialog-mailer-add',
  templateUrl: './dialog-mailer-add.component.html',
  styleUrls: ['./dialog-mailer-add.component.scss']
})
export class DialogMailerAddComponent implements OnInit{
  constructor(
    public dialogRef: MatDialogRef<HeaderComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private vacancyService: VacancyService,
  ) {}
  statuses: any[] = []
  ngOnInit(): void {
       
  this.vacancyService.GetAllRoles().subscribe((statuses) => {
    this.statuses = statuses as any[];
    this.statusInput.values = this.compile_values('status', this.statuses)
  })
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
  add(){
    console.log('add work')
  }
  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }
}
