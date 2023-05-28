import { Injectable, Output, EventEmitter } from '@angular/core';
import { FullUser } from '../models/user.model';
import { AuthService } from './auth.service';
import { UserService } from './user.service';

@Injectable({
  providedIn: 'root',
})
export class ProfileService {
  profile: FullUser | null = null;
  isLoading: boolean = false;
  @Output() ProfileLoaded = new EventEmitter<any>();
  constructor(
    private userService: UserService,
    private authService: AuthService
  ) {}
  private load() {
    this.isLoading = true;
    this.userService.GetProfile().subscribe((profile) => {
      this.isLoading = false;
      this.profile = profile ? (profile as FullUser) : null;
      this.ProfileLoaded.emit(this.profile);
    });
  }
  IsAuthed() {
    return this.authService.IsLoggedIn();
  }
  Logout() {
    this.profile = null;
    this.authService.DeleteTokens();
  }
  GetProfile(hardLoad: boolean = false) {
    if (this.authService.IsLoggedIn()) {
      if (hardLoad) {
        this.profile = null;
        this.load();
      } else if (this.profile) {
        this.ProfileLoaded.emit(this.profile);
      } else if (!this.isLoading) {
        this.load();
      }
    }
  }
}
