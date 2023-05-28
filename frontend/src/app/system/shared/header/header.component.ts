import { MatDialog } from '@angular/material/dialog';
import { WHITE_COLOR } from './../../../shared/consts';
import { ImageService } from './../../../shared/services/image.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LINKS, MATCH_COLOR, TABLE_ACCESS_ROUTE } from 'src/app/shared/consts';
import { FullUser } from 'src/app/shared/models/user.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { environment } from 'src/environments/environment';
import { DialogMailerAddComponent } from '../dialog-mailer-add/dialog-mailer-add.component';
import { Notification } from 'src/app/shared/models/notification.model';
export interface DialogData {}

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  constructor(
    private profileService: ProfileService,
    private imageService: ImageService,
    private router: Router,
    public dialog: MatDialog
  ) {}

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogMailerAddComponent, {
      width: '600px',
      height: '390px',
      data: {},
    });
  }

  role: string = '';

  color: any = WHITE_COLOR;
  links = LINKS;
  ngOnInit() {
    let sub = this.profileService.ProfileLoaded.subscribe((profile) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.role = profile.role.name;
    });
    this.profileService.GetProfile();
  }
  shouldRun = [/(^|\.)plnkr\.co$/, /(^|\.)stackblitz\.io$/].some((h) =>
    h.test(window.location.host)
  );

  getIcon() {
    return `${environment.IMAGES_URL}/${this.profileService.profile?.role.name}_${this.profileService.profile?.gender}.png`;
  }

  drawer(flag: boolean) {
    if (flag) {
      return { color: this.color };
    }
    return {};
  }

  matchColor() {
    return { 'border-bottom': `3px solid ${this.color}` };
  }

  isAccess(path: string) {
    let roles = TABLE_ACCESS_ROUTE[path];
    if (this.profileService.profile?.role && roles) {
      return roles.includes(this.profileService.profile?.role.name);
    }
    return false;
  }

  goToProfile() {
    this.router.navigate(['/system/profile']);
  }

  isUser() {
    return this.profileService.profile;
  }

  logout() {
    this.profileService.Logout();
    this.router.navigate(['/auth/login'], {
      queryParams: { logoutSuccess: true },
    });
  }

  CompileURLImg(url?: string) {
    return this.imageService.CompileURLImg(url);
  }
  value_badge: string = '10';

  acc(title: string) {
    return title == 'Школа наставников' || title == 'Табель';
  }

  isDisabled(){
    return false;
  }

  nots: Notification[]=[{id: 1, user_id: 3, message:'Вы успешно приняты на стажировку!', date: new Date()},
  {id: 1, user_id: 3, message:'Вы успешно приняты на стажировку!', date: new Date()}]
}
