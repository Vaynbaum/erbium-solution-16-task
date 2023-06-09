import { Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { DialogMakeRequestComponent } from '../../shared/dialog-make-request/dialog-make-request.component';
export interface PeriodicElement {
  type: string;
  date_in: string;
  date_out: string;
  status: string;
}
const ELEMENT_DATA: PeriodicElement[] = [
  {type: 'Учебный отпуск', date_in: '08.06.2023 15:35', date_out: '10.06.2023-24.06.2023', status: 'На рассмотрении'},
  {type: 'Больничный', date_in: '15.05.2023 09:40', date_out: '15.05.2023-12.05.2023', status: 'Подтвержден'},
  {type: 'Отпуск за свой счет', date_in: '15.05.2023 09:40', date_out: '15.05.2023-12.05.2023', status: 'Отказано'},
  {type: 'Больничный', date_in: '15.03.2023 09:40', date_out: '15.03.2023-20.03.2023', status: 'Подтвержден'},
  {type: 'Отпуск за свой счет', date_in: '08.01.2023 10:20', date_out: '10.01.2023-15.01.2023', status: 'Отказано'},
  {type: 'Учебный отпуск', date_in: '08.01.2023 10:20', date_out: '10.12.2022-24.12.2022', status: 'Подтвержден'},
  {type: 'Больничный', date_in: '05.11.2022 09:40', date_out: '10.12.2022-24.12.2022', status: 'Подтвержден'},
];
@Component({
  selector: 'app-request',
  templateUrl: './request.component.html',
  styleUrls: ['./request.component.scss']
})
export class RequestComponent implements OnInit{
  constructor(public dialog: MatDialog){}
  ngOnInit(): void {
   
  }
  
  displayedColumns: string[] = ['type', 'date_in', 'date_out', 'status'];
  dataSource = new MatTableDataSource(ELEMENT_DATA);
  openDialog() {
    const dialogRef = this.dialog.open(DialogMakeRequestComponent, {
      width: '600px',
      height: '540px',
      data: {
      },
    });
  }
}
