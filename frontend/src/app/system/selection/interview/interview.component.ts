import { MatSnackBar } from '@angular/material/snack-bar';
import { ImageService } from 'src/app/shared/services/image.service';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { Component } from '@angular/core';
import { UserService } from 'src/app/shared/services/user.service';
import { showMessage } from 'src/app/auth/common';

@Component({
  selector: 'app-interview',
  templateUrl: './interview.component.html',
  styleUrls: ['./interview.component.scss'],
})
export class InterviewComponent {
  constructor(
    private profileService: ProfileService,
    private _snackBar: MatSnackBar,
    private imageService: ImageService,
    private userService: UserService
  ) {}
  interview: any;
  loadInterview() {
    this.userService.GetMyInterview().subscribe((interview: any) => {
      this.interview = interview;
    });
  }
  ngOnInit(): void {
    this.profileService.ProfileLoaded.subscribe((profile) => {
      this.loadInterview();
    });
    this.profileService.GetProfile();
  }
  getFullName(vacancy: any) {
    if (vacancy.mentor)
      return `${vacancy.mentor.user.lastname} ${vacancy.mentor.user.firstname[0]}.${vacancy.mentor.user.patronymic[0]}.`;
    return '';
  }

  passInterview() {
    if (this.interview.selection.vacancy.tasks.length > 0) {
      this.userService.PassInterview(this.interview.id).subscribe(
        (res: any) => {
          showMessage(this._snackBar, res.message);
          this.loadInterview();
        },
        (err) => {
          if (Array.isArray(err.error.detail)) {
            showMessage(this._snackBar, err.error.detail[0].msg);
          } else if (err.error.detail) {
            showMessage(this._snackBar, err.error.detail);
          }
        }
      );
      window.open(
        this.imageService.compileUrlTask(
          this.interview.selection.vacancy.tasks[0].url_portfolio
        ),
        '_blank'
      );
    }
  }
}
