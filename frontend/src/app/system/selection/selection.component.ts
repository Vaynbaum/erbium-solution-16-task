import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { MATCH_COLOR } from 'src/app/shared/consts';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { Vacancy } from 'src/app/shared/models/vacancy.model';
import { ImageService } from 'src/app/shared/services/image.service';
import { UserService } from 'src/app/shared/services/user.service';
import { VacancyService } from 'src/app/shared/services/vacancy.service';

@Component({
  selector: 'app-selection',
  templateUrl: './selection.component.html',
  styleUrls: ['./selection.component.scss', './selection2.component.scss'],
})
export class SelectionComponent implements OnInit {
  constructor(
    private route: ActivatedRoute,
    private userService: UserService,
    private router: Router,
    public dialog: MatDialog,
    private profileService: ProfileService
  ) {}

  inter: boolean = false;
  work: boolean = false;
  project: boolean = false;
  color: any = 'black';
  current_role: any = null;
  getRating() {
    this.userService.GetRating().subscribe((rating: any) => {
      this.rating = rating;
    });
  }
  rating = null;
  ngOnInit(): void {
    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.current_role = profile.role.name;
      this.getRating();
    });
    this.profileService.GetProfile();
    this.dialog.closeAll();
    this.route.queryParams.subscribe((params: Params) => {
      if (params['filter'] == 1) {
        this.inter = true;
        this.work = false;
        this.project = false;
      } else if (params['filter'] == 2) {
        this.inter = false;
        this.work = true;
        this.project = false;
      } else if (params['filter'] == 3) {
        this.inter = false;
        this.work = false;
        this.project = true;
      } else {
        this.inter = false;
        this.work = false;
        this.project = false;
      }
    });
    this.route.queryParams.subscribe((params: Params) => {
      if (params['testing']) {
        this.isClicked['testing'] = true;
        this.isClicked['interview'] = false;
        this.isClicked['school'] = false;
        this.isClicked['case'] = false;
      } else if (params['interview']) {
        this.isClicked['testing'] = false;
        this.isClicked['interview'] = true;
        this.isClicked['school'] = false;
        this.isClicked['case'] = false;
      } else if (params['school']) {
        this.isClicked['testing'] = false;
        this.isClicked['interview'] = false;
        this.isClicked['school'] = true;
        this.isClicked['case'] = false;
      } else if (params['case']) {
        this.isClicked['testing'] = false;
        this.isClicked['interview'] = false;
        this.isClicked['school'] = false;
        this.isClicked['case'] = true;
      }
    });
  }
  mode: any = 'push';
  hasBackdrop: any = false;
  isClicked = { interview: false, school: false, testing: true, case: false };
  clickTest() {
    this.router.navigate(['/system/selection'], {
      queryParams: {
        testing: true,
      },
    });
  }
  clickInter() {
    this.router.navigate(['/system/selection'], {
      queryParams: {
        interview: true,
      },
    });
  }
  clickSchool() {
    this.router.navigate(['system/selection'], {
      queryParams: {
        school: true,
      },
    });
  }
  clickCase() {
    this.router.navigate(['system/selection'], {
      queryParams: {
        case: true,
      },
    });
  }
  clickFilter(filter: any = null) {
    this.router.navigate(['/system/selection'], {
      queryParams: {
        filter: filter,
      },
    });
  }
}
