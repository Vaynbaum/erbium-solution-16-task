import { UserService } from 'src/app/shared/services/user.service';
import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';

export interface PeriodicElement {
  direction: string;
  number_vac: number;
  number_votes: number;
  number_recs: number;
  number_success: number;
}

const ELEMENT_DATA: PeriodicElement[] = [];

@Component({
  selector: 'app-select',
  templateUrl: './select.component.html',
  styleUrls: ['./select.component.scss'],
})
export class SelectComponent implements OnInit {
  @ViewChild(MatSort) sort = new MatSort();
  constructor(private userService: UserService) {}

  ngOnInit(): void {
    this.userService.GetToStatistic().subscribe((res: any) => {
      this.dataSource = new MatTableDataSource(
        res.map((element: any) => {
          return {
            direction: element.name,
            number_vac: element.cnt_vacancy,
            number_votes: element.cnt_response,
            number_recs: element.cnt_not_recs,
            number_success: element.cnt_suc,
          };
        })
      );
    });
  }
  displayedColumns: string[] = [
    'direction',
    'number_vac',
    'number_votes',
    'number_recs',
    'number_success',
  ];
  dataSource = new MatTableDataSource(ELEMENT_DATA);
  ngAfterViewInit() {
    this.dataSource.sort = this.sort;
  }
  applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
  }
}
