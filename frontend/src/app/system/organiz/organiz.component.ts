import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { DialogOrganizationAddComponent } from '../shared/dialog-organization-add/dialog-organization-add.component';
import { VacancyService } from 'src/app/shared/services/vacancy.service';

export interface PeriodicElement {
  name: string;
  contacts: string;
  number_mentor: number;
  email: string;
}

const ELEMENT_DATA: PeriodicElement[] = [];

@Component({
  selector: 'app-organiz',
  templateUrl: './organiz.component.html',
  styleUrls: ['./organiz.component.scss'],
})
export class OrganizComponent implements OnInit {
  @ViewChild(MatSort) sort = new MatSort();
  constructor(
    public dialog: MatDialog,
    private vacancySerivce: VacancyService
  ) {}

  ngOnInit(): void {
    this.vacancySerivce
      .GetAllOganizationWithFilters()
      .subscribe((orgs: any) => {
        this.dataSource = new MatTableDataSource(
          orgs.map((org: any) => {
            return {
              name: org.name,
              contacts: org.phone,
              number_vacancy: org?.number_vacancy,
              number_mentor: org?.number_mentor,
            };
          })
        );
      });
  }
  displayedColumns: string[] = [
    'name',
    'contacts',
    'number_mentor',
    'number_intern',
  ];
  dataSource = new MatTableDataSource(ELEMENT_DATA);
  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
  openDialog() {
    const dialogRef = this.dialog.open(DialogOrganizationAddComponent, {
      width: '600px',
      height: '690px',
      data: {},
    });
  }
}
