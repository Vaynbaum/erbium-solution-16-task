import { ImageService } from 'src/app/shared/services/image.service';
import { UserService } from 'src/app/shared/services/user.service';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';
import { MATCH_COLOR } from 'src/app/shared/consts';
import { SelectInput } from 'src/app/shared/models/input.model';
import { ProfileService } from 'src/app/shared/services/profile.service';
import { FullUser } from 'src/app/shared/models/user.model';
import { CITY, REGION, fetch_id, get_current_age } from 'src/app/auth/common';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { ConstService } from 'src/app/shared/services/const.service'
import { FullCity } from 'src/app/shared/models/city.model';

@Component({
  selector: 'app-intern',
  templateUrl: './intern.component.html',
  styleUrls: [
    './intern1.component.scss',
    './intern2.component.scss',
    './intern_mentor.component.scss',
  ],
})
export class InternComponent implements OnInit {
  //ЛОГИКА ИНПУТОВ----------------------------------------------------------
  form = new FormGroup({
    direction: new FormControl(null),
    industry: new FormControl(null),
    organization: new FormControl(null),
    rating: new FormControl(null),
    skills: new FormControl(null),
    city: new FormControl(null),
  });
  //гениальная заглушка
  statuss: Observable<any> = of([
    { name: 'Подтверждено' },
    { name: 'На рассмотрении' },
    { name: 'Отказано' },
  ]);
  directionInput: SelectInput = {
    field: 'direction',
    type: 'text',
    label: 'Направление',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('direction'),
  };
  industryInput: SelectInput = {
    field: 'industry',
    type: 'text',
    label: 'Отрасль',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('industry'),
  };
  organizationInput: SelectInput = {
    field: 'organization',
    type: 'text',
    label: 'Организация',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('organization'),
  };
  ratingInput: SelectInput = {
    field: 'rating',
    type: 'text',
    label: 'Рейтинг',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('rating'),
  };
  skillsInput: SelectInput = {
    field: 'skills',
    type: 'text',
    label: 'Навыки',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('skills'),
  };
  cityInput: SelectInput = {
    field: 'city',
    type: 'text',
    label: 'Город',
    icon: 'keyboard_arrow_down',
    formControl: this.form.get('city'),
  };
  //----------------------------------------------------------
  color: any = 'black';
  current_role: any = null;
  vacancies_selected: any = null;
  mode: any = 'push';
  hasBackdrop: any = false;
  loaded = false;
  empty = false;
  constructor(
    private userService: UserService,
    private route: ActivatedRoute,
    private router: Router,
    private imageService: ImageService,
    private profileService: ProfileService,
    private vacancyService: VacancyService,
    private constService: ConstService,
  ) {}
  // vacancy_cards: Vacancy[] = [];
  interns: FullUser[] = [];
  inter: boolean = false;
  work: boolean = false;
  project: boolean = false;
  ngOnInit() {
    this.vacancyService.GetAllTrainingDirections().subscribe((directions:any) =>{
      this.directions = directions as any[];
      this.directionInput.values = this.compile_values('direction', this.directions);
    })

    this.vacancyService.GetAllBranchs().subscribe((branchs) => {
      this.branchs = branchs as any[];
      this.industryInput.values = this.compile_values('industry', this.branchs)
    })

    this.vacancyService.GetAllOrganizations().subscribe((organizations) => {
      this.organizations = organizations as any[];
      this.organizationInput.values = this.compile_values('organization', this.organizations)
    })

    this.constService.GetAllSkills().subscribe((skills) => {
      this.skills = skills as any[];
      this.skillsInput.values = this.compile_values('skills', this.skills)
    })

    this.constService.GetAllCities().subscribe((cities) => {
      this.cities = cities as any[];
      this.cityInput.values = this.compile_values('city', this.cities)
    })

    this.userService.GetAllInterns().subscribe((interns: any) => {
      this.interns = interns;
      this.loaded=true
      if (this.interns.length == 0) this.empty = true;
        else this.empty = false;
    });
    let sub = this.profileService.ProfileLoaded.subscribe((profile: any) => {
      sub.unsubscribe();
      if (profile.role) this.color = MATCH_COLOR[profile.role.name];
      this.current_role = profile.role.name;
    });
    this.profileService.GetProfile();
    this.route.queryParams.subscribe((params: Params) => {
      if (params['filter'] == 1) {
        this.inter = true;
        this.work = false;
        this.project = false;
      } else if (params['filter'] == 2) {
        this.inter = false;
        this.work = true;
        this.project = false;
      } else if (params['filter'] == 3) {
        this.inter = false;
        this.work = false;
        this.project = true;
      } else {
        this.inter = false;
        this.work = false;
        this.project = false;
      }
    });
  }
  getImg(img: any) {
    return this.imageService.CompileURLImg(img);
  }

  directions: any[] = []
  branchs: any[] = []
  organizations: any[] = []
  vacancies: any[] = []
  skills: any[] = []
  cities: any[] = []

  onKeyup(field: string, ctr: any) {
    if (field == CITY) {
      let v: any = ctr.value;
      if (v && v.length > 0) {
        let r_v = this.form.get(REGION)?.value;
        this.constService
          .GetAllCitiesBySub(v)
          .subscribe((cities) => {
            this.cities = cities as FullCity[];
            this.cityInput.values = this.compile_values(
              CITY,
              this.cities,
            );
          });
      }
    }
  }

  drop() {
    this.vacancies_selected = null;
  }
  border() {
    return { border: `1px solid ${this.color}` };
  }
  clickFilter(filter: any = null) {
    this.router.navigate(['/system/applications'], {
      queryParams: {
        filter: filter,
      },
    });
  }
  matchColor() {
    return this.color;
  }

  calcAge(birthday: Date | any) {
    return get_current_age(birthday);
  }

  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }
}
