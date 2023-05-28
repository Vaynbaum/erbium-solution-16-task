import { Component } from '@angular/core';
import { ProfileService } from './shared/services/profile.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
})
export class AppComponent {
  title = 'erbium';
  constructor(private profileService: ProfileService) {
    if (this.profileService.IsAuthed()) {
      this.profileService.GetProfile();
    }
  }
}
