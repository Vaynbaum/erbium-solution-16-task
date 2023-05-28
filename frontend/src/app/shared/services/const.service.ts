import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

const URL = `${environment.BACKEND_URL_RESOURCE}/const`;

@Injectable({
  providedIn: 'root',
})
export class ConstService {
  constructor(private http: HttpClient) {}

  GetAllRegions() {
    return this.http.get(`${URL}/get_all_regions`);
  }
  GetAllSkills() {
    return this.http.get(`${URL}/get_all_skills`);
  }

  GetAllСitizenships() {
    return this.http.get(`${URL}/get_all_citizenships`);
  }

  GetAllCities(region_id?: number, substr?: any) {
    let url = `${URL}/get_all_cities`;
    let f = false;
    if (region_id) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `region_id=${region_id}&`;
    }
    if (substr) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `begin_str=${substr}&`;
    }
    return this.http.get(url);
  }

  GetAllCitiesBySub(substr: any) {
    let url = `${URL}/get_all_cities?begin_str=${substr}`;
    return this.http.get(url);
  }

  GetAllUniversities(city_id?: number) {
    let url = `${URL}/get_all_universities`;
    if (city_id) {
      url += `?city_id=${city_id}`;
    }
    return this.http.get(url);
  }

  GetAllCourses() {
    return this.http.get(`${URL}/get_all_courses`);
  }

  GetAllDirections() {
    return this.http.get(`${URL}/get_all_directions`);
  }
}
