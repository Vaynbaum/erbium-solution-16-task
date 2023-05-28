import { Component, OnInit } from '@angular/core';
import { MATCH_COLOR, WHITE_COLOR } from 'src/app/shared/consts';
import { FullUser } from 'src/app/shared/models/user.model';
import { ProfileService } from 'src/app/shared/services/profile.service';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss']
})
export class FooterComponent implements OnInit{
  constructor(
    private profileService: ProfileService,
  ){}
  user: FullUser | null = null;
  color: any = WHITE_COLOR;
  ngOnInit() {
    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      sub.unsubscribe();
      if (profile.role)
      this.color = MATCH_COLOR[profile.role.name]
    });
    this.profileService.GetProfile();
  }
  matchColor(){
    return {'background': this.color}
  }
}
