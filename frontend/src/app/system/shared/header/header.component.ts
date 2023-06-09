import { UserService } from 'src/app/shared/services/user.service';
import { MatDialog } from '@angular/material/dialog';
import { WHITE_COLOR } from './../../../shared/consts';
import { ImageService } from './../../../shared/services/image.service';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LINKS, MATCH_COLOR, TABLE_ACCESS_ROUTE } from 'src/app/shared/consts';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { environment } from 'src/environments/environment';
import { DialogMailerAddComponent } from '../dialog-mailer-add/dialog-mailer-add.component';
export interface DialogData {}
const INTERVAL_UPDATE_DATA = 10000;

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
})
export class HeaderComponent implements OnInit {
  constructor(
    private profileService: ProfileService,
    private imageService: ImageService,
    private userService: UserService,
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
  timer: any;

  color: any = WHITE_COLOR;
  links = LINKS;

  ngOnInit() {
    let sub = this.profileService.ProfileLoaded.subscribe((profile) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.role = profile.role.name;
      this.checkNotReadNote();
      this.getNotes();
    });
    this.profileService.GetProfile();

    this.timer = setInterval(() => {
      this.checkNotReadNote();
      this.getNotes();
    }, INTERVAL_UPDATE_DATA);
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
  value_badge: any = null;

  checkNotReadNote() {
    if (this.profileService.profile) {
      this.userService
        .CntNotRead(this.profileService.profile.id)
        .subscribe((res) => {
          this.value_badge = res != 0 ? res : null;
        });
    }
  }
  readNotes() {
    if (this.profileService.profile) {
      this.value_badge = null;
      this.userService.ReadNotes(this.profileService.profile.id).subscribe();
    }
  }
  getNotes() {
    if (this.profileService.profile) {
      this.userService
        .GetMyNotes(this.profileService.profile.id, 5)
        .subscribe((res) => {
          this.nots = res;
        });
    }
  }

  acc(title: string) {
    return title == 'Школа наставников' || title == 'Табель';
  }

  isDisabled() {
    return false;
  }

  nots: any = [];
}
