import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AuthService } from './auth.service';
import { Observable } from 'rxjs';
import { FullUser, UpdateUserModel } from '../models/user.model';
import { environment } from 'src/environments/environment';
import { UpdateInternModel } from '../models/intern.model';
import { BasicTest, UpdateBasicTest } from '../models/base_test.model';
import { School, UpdateSchool } from '../models/school.model';
import { CreateTask } from '../models/task.model';
const URL = `${environment.BACKEND_URL_RESOURCE}/user`;
@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(
    private httpClient: HttpClient,
    private authService: AuthService
  ) {}

  private getProfile(token: string) {
    return this.httpClient.get(`${URL}/my`, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private deleteProfile(token: string) {
    return this.httpClient.delete(`${URL}/profile`, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private changeImg(img: string, token: string) {
    return this.httpClient.get(`${URL}/change_img`, {
      params: { img: img },
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private changeFile(portfolio: string, token: string) {
    return this.httpClient.get(`${URL}/change_portfolio`, {
      params: { portfolio: portfolio },
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  ChangeFile(portfolio: string) {
    return new Observable((observer) => {
      this.changeFile(portfolio, this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.changeFile(
                portfolio,
                this.authService.GetAccessToken()
              ).subscribe(
                (response) => observer.next(response),
                (err) => observer.next(err)
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  ChangeImg(img: string) {
    return new Observable((observer) => {
      this.changeImg(img, this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.changeImg(img, this.authService.GetAccessToken()).subscribe(
                (response) => observer.next(response),
                (err) => observer.next(err)
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  DeleteProfile() {
    return new Observable((observer) => {
      this.deleteProfile(this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(null);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.deleteProfile(this.authService.GetAccessToken()).subscribe(
                (response) => observer.next(null),
                (err) => observer.next(null)
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  private deleteSelection(selection_id: number, token: string) {
    return this.httpClient.delete(`${URL}/selection`, {
      headers: { Authorization: `Bearer ${token}` },
      params: { selection_id: selection_id },
    });
  }

  DeleteSelection(selection_id: number) {
    return new Observable((observer) => {
      this.deleteSelection(
        selection_id,
        this.authService.GetAccessToken()
      ).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.deleteSelection(
                selection_id,
                this.authService.GetAccessToken()
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  private deleteSkill(skill_id: number, token: string) {
    return this.httpClient.delete(`${URL}/skill`, {
      headers: { Authorization: `Bearer ${token}` },
      params: { skill_id: skill_id },
    });
  }

  private addSkill(token: string, skill: number | string) {
    let url = `${URL}/add_skill?`;
    if (typeof skill == 'number') url += `skill_id=${skill}`;
    else url += `skill_name=${skill}`;
    return this.httpClient.get(url, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private updateUser(token: string, user: UpdateUserModel) {
    return this.httpClient.put(`${URL}/update_user`, user, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private verifyUser(token: string) {
    return this.httpClient.get(`${URL}/verified_user`, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private updateIntern(token: string, user: UpdateInternModel) {
    return this.httpClient.put(`${URL}/update_intern`, user, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  GetAllResponseStatus() {
    return this.httpClient.get(`${URL}/status_responses`);
  }

  UpdateIntern(user: UpdateInternModel) {
    return new Observable((observer) => {
      let s = this.updateIntern(
        this.authService.GetAccessToken(),
        user
      ).subscribe(
        (response) => {
          s.unsubscribe();
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.updateIntern(
                this.authService.GetAccessToken(),
                user
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  VerifyUser() {
    return new Observable((observer) => {
      this.verifyUser(this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.verifyUser(this.authService.GetAccessToken()).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  UpdateUser(user: UpdateUserModel) {
    return new Observable((observer) => {
      this.updateUser(this.authService.GetAccessToken(), user).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.updateUser(
                this.authService.GetAccessToken(),
                user
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  private postRenspone(token: string, vacancy_id: number) {
    return this.httpClient.get(`${URL}/response?vacancy_id=${vacancy_id}`, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private getAllBasicTests(token: string) {
    return this.httpClient.get(`${URL}/base_tests`, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  saveTest(token: string, test: UpdateBasicTest) {
    return this.httpClient.put(`${URL}/change_base_test`, test, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private getAllInterns(token: string, mentors?: boolean) {
    let url = `${URL}/interns`;
    if (mentors) {
      url += `?mentors=${mentors}`;
    }
    return this.httpClient.get(url, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  GetToStatistic() {
    return this.httpClient.get(`${URL}/to_statistic`);
  }

  GetToStatisticWorkExp() {
    return this.httpClient.get(`${URL}/cnt_all_interns_by_work_experiens`);
  }
  GetToStatisticUniversity() {
    return this.httpClient.get(`${URL}/cnt_all_interns_by_university`);
  }
  GetToStatisticDirection() {
    return this.httpClient.get(`${URL}/cnt_all_interns_by_direction`);
  }

  GetSelectionToStat(organization_id: any) {
    return this.httpClient.get(`${URL}/result_interview`, {
      params: {
        organization_id: organization_id,
      },
    });
  }

  postPresence(token: string, presence: any) {
    return this.httpClient.post(`${URL}/add_presence`, presence, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  getPresence(token: string) {
    return this.httpClient.get(`${URL}/my_presence`, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }
  GetPresence() {
    return new Observable((observer) => {
      this.getPresence(this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getPresence(this.authService.GetAccessToken()).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  PostPresence(presence: any) {
    return new Observable((observer) => {
      this.postPresence(this.authService.GetAccessToken(), presence).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.postPresence(
                this.authService.GetAccessToken(),
                presence
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  GetAllInterns(mentors?: boolean) {
    return new Observable((observer) => {
      this.getAllInterns(this.authService.GetAccessToken(), mentors).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getAllInterns(
                this.authService.GetAccessToken(),
                mentors
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  // private commonFunc() {

  // }
  private getRating(token: string, to_mentor?: boolean) {
    let url = `${URL}/rating`;
    if (to_mentor) url += `to_mentor=${to_mentor}`;

    return this.httpClient.get(url, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }
  private changeStatusResponse(id: number, status_id: number, token: string) {
    return this.httpClient.get(`${URL}/change_response`, {
      headers: { Authorization: `Bearer ${token}` },
      params: { response_id: id, status_id: status_id },
    });
  }

  private changeSelection(id: number, stage_id: number, token: string) {
    return this.httpClient.get(`${URL}/change_selection`, {
      headers: { Authorization: `Bearer ${token}` },
      params: { selection_id: id, stage_id: stage_id },
    });
  }
  ChangeSelection(id: number, status_id: number) {
    return new Observable((observer) => {
      this.changeSelection(
        id,
        status_id,
        this.authService.GetAccessToken()
      ).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.changeSelection(
                id,
                status_id,
                this.authService.GetAccessToken()
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }
  PostTask(task: CreateTask) {
    return this.httpClient.post(`${URL}/task_interview`, task);
  }

  GetInv(email: any, role_id: number) {
    return this.httpClient.get(`${URL}/invitation`, {
      params: { email: email, role_id: role_id },
    });
  }
  ChangeStatusResponse(id: number, status_id: number) {
    return new Observable((observer) => {
      this.changeStatusResponse(
        id,
        status_id,
        this.authService.GetAccessToken()
      ).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.changeStatusResponse(
                id,
                status_id,
                this.authService.GetAccessToken()
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  GetRating(to_mentor?: boolean) {
    return new Observable((observer) => {
      this.getRating(this.authService.GetAccessToken(), to_mentor).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getRating(
                this.authService.GetAccessToken(),
                to_mentor
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }
  SaveTest(test: UpdateBasicTest) {
    return new Observable((observer) => {
      this.saveTest(this.authService.GetAccessToken(), test).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.saveTest(this.authService.GetAccessToken(), test).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  saveSchool(token: string, school: UpdateSchool) {
    return this.httpClient.put(`${URL}/change_school`, school, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  SaveSchool(school: UpdateSchool) {
    return new Observable((observer) => {
      this.saveSchool(this.authService.GetAccessToken(), school).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.saveSchool(
                this.authService.GetAccessToken(),
                school
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  GotoSchool() {
    return this.httpClient.get(`${environment.FAKE_API_URL}/fake_scholl`);
  }

  GotoTest(test: BasicTest) {
    return this.httpClient.get(`${environment.FAKE_API_URL}/fake_test`, {
      params: {
        test_name: test.type_basic_test.name,
        test_id: test.type_basic_test_id,
      },
    });
  }

  GetAllBasicTests() {
    return new Observable((observer) => {
      this.getAllBasicTests(this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getAllBasicTests(
                this.authService.GetAccessToken()
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.error(err);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  private getAllResponses(
    token: string,
    to_curator?: boolean,
    org_id?: number
  ) {
    let url = `${URL}/responses`;
    let f = false;
    if (to_curator) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `to_curator=${to_curator}&`;
    }
    if (org_id) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `org_id=${org_id}&`;
    }
    return this.httpClient.get(url, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  private getAllSelections(token: string, organization_id: number) {
    return this.httpClient.get(`${URL}/selections_to_mentor`, {
      headers: { Authorization: `Bearer ${token}` },
      params: { organization_id: organization_id },
    });
  }

  GetAllSelections(organization_id: number) {
    return new Observable((observer) => {
      this.getAllSelections(
        this.authService.GetAccessToken(),
        organization_id
      ).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getAllSelections(
                this.authService.GetAccessToken(),
                organization_id
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  private getMyScholl(token: string) {
    return this.httpClient.get(`${URL}/my_school`, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  GetMyScholl() {
    return new Observable((observer) => {
      this.getMyScholl(this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getMyScholl(this.authService.GetAccessToken()).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  GetAllResponses(to_curator?: boolean, org_id?: number) {
    return new Observable((observer) => {
      this.getAllResponses(
        this.authService.GetAccessToken(),
        to_curator,
        org_id
      ).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getAllResponses(
                this.authService.GetAccessToken(),
                to_curator,
                org_id
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.error(err);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  PostRenspone(vacancy_id: number) {
    return new Observable((observer) => {
      this.postRenspone(
        this.authService.GetAccessToken(),
        vacancy_id
      ).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.postRenspone(
                this.authService.GetAccessToken(),
                vacancy_id
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.error(err);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  AddSkill(skill: any) {
    return new Observable((observer) => {
      this.addSkill(this.authService.GetAccessToken(), skill).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.addSkill(this.authService.GetAccessToken(), skill).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  DeleteSkill(skill_id: number) {
    return new Observable((observer) => {
      this.deleteSkill(skill_id, this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.deleteSkill(
                skill_id,
                this.authService.GetAccessToken()
              ).subscribe(
                (response) => {
                  observer.next(response);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }

  GetProfile() {
    return new Observable((observer) => {
      this.getProfile(this.authService.GetAccessToken()).subscribe(
        (response) => {
          observer.next(response as FullUser);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.getProfile(this.authService.GetAccessToken()).subscribe(
                (response) => {
                  observer.next(response as FullUser);
                },
                (err) => {
                  observer.next(null);
                }
              );
            });
            this.authService.RefreshToken();
          }
        }
      );
    });
  }
}
