import { WHITE_COLOR } from './../shared/consts';
import { FullUser } from 'src/app/shared/models/user.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { Component, OnInit } from '@angular/core';
import { LINKS, MATCH_COLOR, TABLE_ACCESS_ROUTE } from '../shared/consts';

@Component({
  selector: 'app-system',
  templateUrl: './system.component.html',
  styleUrls: ['./system.component.scss'],
})
export class SystemComponent implements OnInit {
  mode: any = 'over';
  hasBackdrop: any = true;
  constructor(private profileService: ProfileService) {}
  links = LINKS;
  user: FullUser | null = null;
  color: any = WHITE_COLOR;
  ngOnInit() {
    let sub = this.profileService.ProfileLoaded.subscribe((profile) => {
      sub.unsubscribe();
      this.user = profile;
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
    });
    this.profileService.GetProfile();
  }

  drawerColor(flag: boolean) {
    if (flag) {
      return { color: this.color };
    }
    return {};
  }

  isAccess(path: string) {
    let roles = TABLE_ACCESS_ROUTE[path];
    if (this.user?.role && roles) {
      return roles.includes(this.user?.role.name);
    }
    return false;
  }

  acc(title: string) {
    return title == 'Школа наставников' || title == 'Табель';
  }
}
