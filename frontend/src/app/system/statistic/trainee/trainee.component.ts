import { Component, OnInit, ViewChild } from '@angular/core';
import { ChartConfiguration, ChartOptions } from 'chart.js';
import { BaseChartDirective } from 'ng2-charts';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-trainee',
  templateUrl: './trainee.component.html',
  styleUrls: ['./trainee.component.scss'],
})
export class TraineeComponent implements OnInit {
  constructor(private userService: UserService) {}
  ngOnInit(): void {
    this.userService.GetToStatisticDirection().subscribe((res: any) => {
      this.barChartLabels1 = res.map((label: any) => {
        return '';
      });
      this.barChartDatasets1 = res.map((dataset: any) => {
        return {
          data: [dataset.cnt_intern],
          label: dataset.name,
        };
      });
    });
    this.userService.GetToStatisticWorkExp().subscribe((res: any) => {
      this.pieChartLabels = res.map((label: any) => {
        return label.name;
      });
      this.pieChartDatasets[0].data = res.map((dataset: any) => {
        return dataset.cnt_intern;
      });
    });
    this.userService.GetToStatisticUniversity().subscribe((res: any) => {
      this.pieChartLabels2 = res.map((label: any) => {
        return label.sub;
      });
      this.pieChartDatasets2[0].data = res.map((dataset: any) => {
        return dataset.cnt_intern;
      });
    });
  }

  //ПЕРВАЯ ДИАГРАММА
  public barChartLegend1 = true;
  public barChartOptions1: ChartOptions<'bar'> = {
    responsive: true,
    maintainAspectRatio: true,
  };
  public barChartLabels1 = [];
  public barChartDatasets1 = [{ data: [] }];

  // // ВТОРАЯ ДИАГРАММА
  public pieChartOptions2: ChartOptions<'doughnut'> = {
    responsive: true,
    maintainAspectRatio: true,
  };
  public pieChartLabels2 = [];
  public pieChartDatasets2 = [{ data: [] }];
  public pieChartLegend2 = true;

  //ТРЕТЬЯ ДИАГРАММА
  public pieChartOptions: ChartOptions<'doughnut'> = {
    responsive: true,
    maintainAspectRatio: true,
  };
  public pieChartLabels = [];
  public pieChartDatasets = [{ data: [] }];
  public pieChartLegend = true;
}
