import { Component, OnInit } from '@angular/core';
import { MATCH_COLOR } from 'src/app/shared/consts';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { UserService } from 'src/app/shared/services/user.service';
const INTERVAL_UPDATE_DATA = 10000;

@Component({
  selector: 'app-all-notifications',
  templateUrl: './all-notifications.component.html',
  styleUrls: ['./all-notifications.component.scss'],
})
export class AllNotificationsComponent implements OnInit {
  color: string = 'black'
  constructor(
    private profileService: ProfileService,
    private userService: UserService
  ) {}
  ngOnInit(): void {
    let sub = this.profileService.ProfileLoaded.subscribe((profile) => {
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      sub.unsubscribe();
      this.getNotes();
    });
    this.profileService.GetProfile();
  }
  nots: any = [];
  empty = true;
  loaded = false;

  getNotes() {
    if (this.profileService.profile) {
      this.userService
        .GetMyNotes(this.profileService.profile.id)
        .subscribe((res) => {
          this.nots = res;
          this.loaded = true;
          if (this.nots.length == 0) this.empty = true;
          else this.empty = false;
        });
      this.userService.ReadNotes(this.profileService.profile.id).subscribe();
    }
  }
}
