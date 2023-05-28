import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';
import { CreateOrganization } from '../models/organization.model';
import { CreateVacancy } from '../models/vacancy.model';
const URL = `${environment.BACKEND_URL_RESOURCE}/vacancy`;

@Injectable({
  providedIn: 'root',
})
export class VacancyService {
  constructor(private http: HttpClient) {}
  GetAllBranchs() {
    return this.http.get(`${URL}/get_all_branchs`);
  }
  GetAllRoles(): Observable<any> {
    return of([
      { name: 'Куратор', id: 2 },
      { name: 'Наставник', id: 1 },
      { name: 'Кадровый специалист', id: 3 },
    ]);
  }
  GetAllTrainingDirections() {
    return this.http.get(`${URL}/get_all_training_directions`);
  }

  GetAllOrganizations() {
    return this.http.get(`${URL}/get_all_organizations`);
  }

  GetAllWorkExperiencies() {
    return this.http.get(`${URL}/get_all_work_experiences`);
  }
  GetAllWorkSchedules() {
    return this.http.get(`${URL}/get_all_work_schedules`);
  }
  GetAllEmploymentTypes() {
    return this.http.get(`${URL}/get_all_employment_types`);
  }
  GetAllOrganizationTypes() {
    return this.http.get(`${URL}/get_all_organization_types`);
  }
  GetAllMetros() {
    return this.http.get(`${URL}/get_all_metros`);
  }

  GetVacById(id: number) {
    return this.http.get(`${URL}/get_by_id?id=${id}`);
  }

  GetAllVacanciesNotForIntern(organization_ids?: number) {
    let url = `${URL}/get_all_vacancies?to_intern=${false}&`;
    if (organization_ids) url += `organization_ids=${organization_ids}&`;
    return this.http.get(url);
  }

  ChangeStatusVacancy(vacancy_id: number, status_id: number) {
    return this.http.get(`${URL}/change_status_vacancy`, {
      params: {
        vacancy_id: vacancy_id,
        status_id: status_id,
      },
    });
  }

  DeleteVacancy(vacancy_id: number) {
    return this.http.delete(`${URL}/vacancy`, {
      params: { vacancy_id: vacancy_id },
    });
  }

  PostPredictAISkills(description: string) {
    return this.http.post(`${environment.BACKEND_URL_AI}/tag`, {
      text: description,
    });
  }

  GetAllTimes(): Observable<any> {
    return of([
      { name: 'За неделю' },
      { name: 'За месяц' },
      { name: 'За все время' },
    ]);
  }
  GetAllStatuses(): Observable<any> {
    return of([
      { name: 'На рассмотрении' },
      { name: 'Корректировка' },
      { name: 'Опубликовано' },
    ]);
  }
  GetAllStatusesForMentors(): Observable<any> {
    return of([{ name: 'Был' }, { name: 'Не был' }, { name: 'Отпуск' }]);
  }
  GetAllVacanciesWithFilters(
    organization_ids?: number[],
    work_experience_id?: number,
    employment_type_ids?: number[],
    work_schedule_ids?: number[],
    branch_ids?: number[],
    training_direction_ids?: number[],

    salary?: number,
    substr?: any
  ) {
    let url = `${URL}/get_all_vacancies`;
    let f = false;
    if (work_experience_id) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `work_experience_id=${work_experience_id}&`;
    }
    if (employment_type_ids && employment_type_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      employment_type_ids.forEach((i) => {
        url += `employment_type_ids=${i}&`;
      });
    }
    if (work_schedule_ids && work_schedule_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      work_schedule_ids.forEach((i) => {
        url += `work_schedule_ids=${i}&`;
      });
    }
    if (branch_ids && branch_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      branch_ids.forEach((i) => {
        url += `branch_ids=${i}&`;
      });
    }
    if (training_direction_ids && training_direction_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      training_direction_ids.forEach((i) => {
        url += `training_direction_ids=${i}&`;
      });
    }
    if (organization_ids && organization_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      organization_ids.forEach((i) => {
        url += `organization_ids=${i}&`;
      });
    }
    if (salary) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `salary=${salary}&`;
    }
    if (substr) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `substr=${substr}&`;
    }
    return this.http.get(url);
  }

  GetCoord(address: any) {
    return this.http.get(
      `https://geocode-maps.yandex.ru/1.x/?format=json&apikey=${environment.API_KEY}&geocode=${address}`
    );
  }

  PostOrg(org: CreateOrganization) {
    return this.http.post(`${URL}/create_organization`, org);
  }

  PostVac(vac: CreateVacancy) {
    return this.http.post(`${URL}/vacancy`, vac);
  }

  GetAllOganizationWithFilters(
    type_ids?: number[],
    branch_ids?: number[],
    training_direction_ids?: number[],
    score?: number,
    substr?: any
  ) {
    let url = `${URL}/get_all_full_organizations`;
    let f = false;
    if (type_ids && type_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      type_ids.forEach((i) => {
        url += `type_ids=${i}&`;
      });
    }
    if (branch_ids && branch_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      branch_ids.forEach((i) => {
        url += `branch_ids=${i}&`;
      });
    }
    if (training_direction_ids && training_direction_ids?.length > 0) {
      if (!f) {
        url += '?';
        f = true;
      }
      training_direction_ids.forEach((i) => {
        url += `training_direction_ids=${i}&`;
      });
    }
    if (score) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `score=${score}&`;
    }
    if (substr) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `substr=${substr}&`;
    }
    return this.http.get(url);
  }
}
