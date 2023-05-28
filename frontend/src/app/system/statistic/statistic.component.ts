import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { MATCH_COLOR } from 'src/app/shared/consts';
import { ProfileService } from 'src/app/shared/services/profile.service';

@Component({
  selector: 'app-statistic',
  templateUrl: './statistic.component.html',
  styleUrls: ['./statistic.component.scss']
})
export class StatisticComponent implements OnInit{
//ЛОГИКА ИНПУТОВ----------------------------------------------------------
mode: any = 'push';
color: any = 'black';
current_role: any = null;
hasBackdrop: any = false;
constructor(
  private route: ActivatedRoute,
  private router: Router,
  private profileService: ProfileService
) {}
inter: boolean = true;
work: boolean = false;
project: boolean = false;
vacan: boolean = false;
ngOnInit() {
  let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
    sub.unsubscribe();
    if (profile.role) this.color = MATCH_COLOR[profile.role.name];
    this.current_role = profile.role.name;
  });
  this.profileService.GetProfile();
  this.route.queryParams.subscribe((params: Params) => {
    if (params['filter'] == 1) {
      this.inter = true;
      this.work = false;
      this.project = false;
      this.vacan = false;
    } else if (params['filter'] == 2) {
      this.inter = false;
      this.work = true;
      this.project = false;
      this.vacan = false;
    } else if (params['filter'] == 3) {
      this.inter = false;
      this.work = false;
      this.project = true;
      this.vacan = false;
    } else if (params['filter'] == 4) {
      this.inter = false;
      this.work = false;
      this.project = false;
      this.vacan = true;
    }
  });
}
clickFilter(filter: any = null) {
  this.router.navigate(['/system/statistic'], {
    queryParams: {
      filter: filter,
    },
  });
}
matchColor() {
  return this.color;
}
}
