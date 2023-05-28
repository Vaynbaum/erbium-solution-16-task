import { MatSnackBar } from '@angular/material/snack-bar';
import {
  CURATOR,
  HR,
  MATCH_LIGHT_COLOR,
  MENTOR,
  WHITE_COLOR,
} from './../../shared/consts';
import {
  BRANCH,
  COURSE,
  DIRECTION,
  EMAIL,
  EXPERIENS,
  GITHUB,
  INTERNSHIP_STATUS,
  ORGANIZATION,
  ORGANIZATIONS,
  PHONE,
  PORTFOLIO,
  SKILL,
  TRAINING_DIRECTION,
  VK,
  fetch_id,
  get_current_age,
  redirect,
  showMessage,
} from './../../auth/common';
import { FullUser, UpdateUserModel } from 'src/app/shared/models/user.model';
import { ProfileService } from './../../shared/services/profile.service';
import { ImageService } from 'src/app/shared/services/image.service';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { Component, OnInit, OnDestroy } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Input, SelectInput } from 'src/app/shared/models/input.model';
import {
  CITY,
  COUNTRY,
  DATEBIRTH,
  FIRSTNAME,
  INSTITUTE,
  LASTNAME,
  PATRONYMIC,
  REGION,
  createDateInput,
  createEmailInput,
  createFieldInput,
  createPhoneInput,
} from 'src/app/auth/common';
import { FullCity } from 'src/app/shared/models/city.model';
import { University } from 'src/app/shared/models/university.model';
import { ConstService } from 'src/app/shared/services/const.service';
import { Direction } from '@angular/cdk/bidi';
import { Сitizenship } from 'src/app/shared/models/citizenship.model';
import { Course } from 'src/app/shared/models/course.model';
import { Region } from 'src/app/shared/models/region.model';
import { INTERN, MATCH_COLOR } from 'src/app/shared/consts';
import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { TrainingDirection } from 'src/app/shared/models/training_direction.model';
import { Organization } from 'src/app/shared/models/organization.model';
import { Branch } from 'src/app/shared/models/branch.model';
import { Skill } from 'src/app/shared/models/skill.model';
import { WorkExperience } from 'src/app/shared/models/work_experience.model';
import { UserService } from 'src/app/shared/services/user.service';
import { SkillIntern } from 'src/app/shared/models/skill_intern.model';
import { UpdateInternModel } from 'src/app/shared/models/intern.model';
import { NgxCroppedEvent, NgxPhotoEditorService } from 'ngx-photo-editor';
import { Router } from '@angular/router';

const APPLY_BTN_TEXT = 'Сохранить и продолжить';
const CLOSEB_BTN_TEXT = 'Вернуться назад';

enum inp {
  COUNTRY,
  REGION,
  CITY,
}

enum inpE {
  INSTITUTE,
  DIRECTION,
  COURSE,
}

enum inpF {
  BRANCH,
  ORGANIZATION,
}

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile1.component.scss', './profile2.component.scss'],
})
export class ProfileComponent implements OnInit, OnDestroy {
  constructor(
    private profileService: ProfileService,
    private userService: UserService,
    private constService: ConstService,
    private vacancyService: VacancyService,
    private imageService: ImageService,
    private photoEditorService: NgxPhotoEditorService,
    private _snackBar: MatSnackBar,
    private router: Router
  ) {}

  user: FullUser | null = null;
  sub: any;
  rating = 0;
  color: any = WHITE_COLOR;
  isMyAccount: boolean = false;
  lightColor: any = WHITE_COLOR;
  output?: NgxCroppedEvent;
  displayChange = true;

  skillFormGroup = new FormGroup({
    skill: new FormControl(),
  });
  mainInfoFormGroup = new FormGroup({
    lastname: new FormControl(this.user?.lastname, [Validators.required]),
    firstname: new FormControl(this.user?.firstname, [Validators.required]),
    patronymic: new FormControl(this.user?.patronymic),
    date_of_birth: new FormControl(this.user?.birthdate, [Validators.required]),
  });
  positionFormGroup = new FormGroup({
    country: new FormControl(this.user?.citizenship.name, [
      Validators.required,
    ]),
    city: new FormControl(this.user?.city.name, [Validators.required]),
    region: new FormControl(this.user?.city?.region?.name, [
      Validators.required,
    ]),
  });
  contactFormGroup = new FormGroup({
    phone: new FormControl(this.user?.phone, [Validators.required]),
    email: new FormControl(this.user?.email, [
      Validators.required,
      Validators.email,
    ]),
  });
  interningFormGroup = new FormGroup({
    training_direction: new FormControl(''),
    internship_status: new FormControl({
      value: this.user?.intern?.internship_status.name,
      disabled: true,
    }),
  });
  favoriteFormGroup = new FormGroup({
    branch: new FormControl(''),
    organization: new FormControl(''),
  });
  educationFormGroup = new FormGroup({
    institute: new FormControl(this.user?.intern?.university?.name, [
      Validators.required,
    ]),
    direction: new FormControl(this.user?.intern?.direction?.name, [
      Validators.required,
    ]),
    course: new FormControl(this.user?.intern?.course?.name, [
      Validators.required,
    ]),
  });

  profilesFormGroup = new FormGroup({
    github: new FormControl(''),
    vk: new FormControl(''),
    portfolio: new FormControl(''),
  });
  experFormGroup = new FormGroup({
    experiens: new FormControl(''),
    organizations: new FormControl(''),
  });
  aboutmeControl = new FormControl('');
  orgInpNotIntern = new FormGroup({
    organization: new FormControl(
      this.user?.role?.name
        ? this.user?.mentor?.organization?.name
        : this.user?.hr?.organization?.name,
      [Validators.required]
    ),
  });
  favorite_inps: SelectInput[] = [
    {
      field: BRANCH,
      type: 'text',
      label: 'Укажите желаемую отрасль для стажировки',
      placeholder: 'Загрузка списка отраслей...',
      formControl: this.favoriteFormGroup.get(BRANCH),
    },
    {
      field: ORGANIZATION,
      type: 'text',
      label: 'Укажите желаемую организацию',
      placeholder: 'Загрузка списка организаций...',
      formControl: this.favoriteFormGroup.get(ORGANIZATION),
    },
  ];
  training_direction_inp: SelectInput = {
    field: TRAINING_DIRECTION,
    type: 'text',
    label: 'Направление',
    placeholder: 'Загрузка списка направлений...',
    formControl: this.interningFormGroup.get(TRAINING_DIRECTION),
  };
  organizationInp: SelectInput = {
    field: ORGANIZATION,
    type: 'text',
    label: 'Организация',
    placeholder: 'Загрузка списка организаций...',
    formControl: this.orgInpNotIntern.get(ORGANIZATION),
    onClick: (value: any) => {},
    messageError: () => {
      ORGANIZATION;
      if (this.orgInpNotIntern.get(ORGANIZATION)?.['errors']?.['required']) {
        return `Необходимо выбрать`;
      }
      return '';
    },
  };
  selectInputs: SelectInput[] = [
    {
      field: COUNTRY,
      type: 'text',
      label: 'Гражданство',
      placeholder: 'Загрузка списка гражданств...',
      formControl: this.positionFormGroup.get(COUNTRY),
      onClick: (value: any) => {},
      messageError: () => {
        if (this.positionFormGroup.get(COUNTRY)?.['errors']?.['required']) {
          return `Необходимо выбрать`;
        }
        return '';
      },
    },
    {
      field: REGION,
      type: 'text',
      label: 'Регион',
      placeholder: 'Загрузка списка регионов...',
      formControl: this.positionFormGroup.get(REGION),
      onClick: (value: any) => {
        this.constService.GetAllCities(value.id).subscribe((cities) => {
          this.cities = cities as FullCity[];
          this.selectInputs[inp.CITY].values = this.compile_values(
            CITY,
            this.cities,
            this.positionFormGroup
          );
        });
      },
      messageError: () => {
        CITY;
        if (this.positionFormGroup.get(COUNTRY)?.['errors']?.['required']) {
          return `Необходимо выбрать`;
        }
        return '';
      },
    },
    {
      field: CITY,
      label: 'Город',
      type: 'text',
      placeholder: 'Загрузка списка городов...',
      formControl: this.positionFormGroup.get(CITY),
      messageError: () => {
        CITY;
        if (this.positionFormGroup.get(CITY)?.['errors']?.['required']) {
          return `Необходимо выбрать`;
        }
        return '';
      },
      onClick: (value: any) => {
        this.constService
          .GetAllUniversities(value.id)
          .subscribe((institutes) => {
            this.institutes = institutes as University[];
            this.educations[inpE.INSTITUTE].values = this.compile_values(
              INSTITUTE,
              this.institutes,
              this.educationFormGroup
            );
          });
      },
    },
  ];
  educations: SelectInput[] = [
    {
      field: INSTITUTE,
      type: 'text',
      label: 'Вуз',
      placeholder: 'Загрузка списка ВУЗов...',
      formControl: this.educationFormGroup.get(INSTITUTE),
      messageError: () => {
        if (this.educationFormGroup.get(INSTITUTE)?.['errors']?.['required']) {
          return `Необходимо выбрать`;
        }
        return '';
      },
    },
    {
      field: DIRECTION,
      type: 'text',
      label: 'Направление',
      placeholder: 'Загрузка списка направлений...',
      formControl: this.educationFormGroup.get(DIRECTION),
      messageError: () => {
        if (this.educationFormGroup.get(DIRECTION)?.['errors']?.['required']) {
          return `Необходимо выбрать`;
        }
        return '';
      },
    },
    {
      field: COURSE,
      type: 'text',
      label: 'Курс',
      placeholder: 'Загрузка списка курсов...',
      formControl: this.educationFormGroup.get(COURSE),
      messageError: () => {
        if (this.educationFormGroup.get(COURSE)?.['errors']?.['required']) {
          return `Необходимо выбрать`;
        }
        return '';
      },
    },
  ];
  skill_inp: SelectInput = {
    field: SKILL,
    type: 'text',
    label: 'Навыки',
    placeholder: 'Загрузка списка навыков...',
    formControl: this.skillFormGroup.get(SKILL),
  };
  exp_inp: SelectInput = {
    field: EXPERIENS,
    type: 'text',
    label: 'Опыт работы в желаемой отрасли',
    placeholder: 'Загрузка списка...',
    formControl: this.experFormGroup.get(EXPERIENS),
  };
  internship_status_inp: Input = {
    type: 'text',
    icon: 'grade',
    label: 'Статус',
    formControl: this.interningFormGroup.get?.(INTERNSHIP_STATUS),
  };
  inputs: Input[] = [
    createFieldInput(
      this.mainInfoFormGroup,
      'Фамилия',
      LASTNAME,
      'person_outline',
      'Фамилия'
    ),
    createFieldInput(
      this.mainInfoFormGroup,
      'Имя',
      FIRSTNAME,
      'person_outline',
      'Имя'
    ),
    createFieldInput(
      this.mainInfoFormGroup,
      'Отчество',
      PATRONYMIC,
      'person_outline',
      'Отчество'
    ),
  ];
  profile_inps: Input[] = [
    {
      type: 'text',
      icon: 'hub',
      label: 'GitHub',
      placeholder: 'Профиль GitHub',
      formControl: this.profilesFormGroup.get?.(GITHUB),
    },
    {
      type: 'text',
      icon: 'groups',
      label: 'ВКонтакте',
      placeholder: 'Профиль ВКонтакте',
      formControl: this.profilesFormGroup.get?.(VK),
    },
    {
      type: 'text',
      icon: 'article',
      label: 'Портфолио',
      placeholder: 'Ссылка на портфолио',
      formControl: this.profilesFormGroup.get?.(PORTFOLIO),
    },
  ];
  contacts: Input[] = [
    createPhoneInput(this.contactFormGroup, 'Телефон', PHONE, 'Телефон'),
    createEmailInput(this.contactFormGroup, 'E-mail'),
  ];
  inputDate: Input = createDateInput(
    this.mainInfoFormGroup,
    'Дату рождения',
    DATEBIRTH,
    'Дата',
    'Дата рождения'
  );
  aboutme_inp: Input = {
    type: 'textarea',
    label: 'О себе',
    placeholder: 'Расскажите о себе...',
    formControl: this.aboutmeControl,
  };
  org_inp: Input = {
    type: 'text',
    label: 'Укажите место работы',
    placeholder: 'Организация',
    formControl: this.experFormGroup.get(ORGANIZATIONS),
  };

  allSkillsFiltered: Observable<any[]> | null = null;
  genderFlag = this.user?.gender;
  separatorKeysCodes: number[] = [ENTER, COMMA];

  regions: Region[] = [];
  countries: Сitizenship[] = [];
  cities: FullCity[] = [];
  institutes: University[] = [];
  courses: Course[] = [];
  directions: Direction[] = [];
  training_directions: TrainingDirection[] = [];
  organizations: Organization[] = [];
  branchs: Branch[] = [];
  allSkills: Skill[] = [];
  experines: WorkExperience[] = [];
  organizations_notfor_intern: Organization[] = [];
  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  onKeyup(field: string, ctr: any) {
    if (field == CITY) {
      let v: any = ctr.value;
      if (v && v.length > 0) {
        let r_v = this.positionFormGroup.get(REGION)?.value;
        this.constService
          .GetAllCities(fetch_id(this.regions, r_v), v)
          .subscribe((cities) => {
            this.cities = cities as FullCity[];
            this.selectInputs[inp.CITY].values = this.compile_values(
              CITY,
              this.cities,
              this.positionFormGroup
            );
          });
      }
    }
  }

  isIntern() {
    return this.user?.role.name == INTERN;
  }

  isMentHR() {
    return this.user?.role.name == MENTOR || this.user?.role.name == HR;
  }

  compile_values(name: string, arr: any[], form: any) {
    return form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }

  toggle(flag: boolean) {
    this.genderFlag = flag;
  }

  calcAge(birthday: Date) {
    return get_current_age(birthday);
  }

  getRating() {
    this.userService
      .GetRating(this.user?.role_id == 1)
      .subscribe((rating: any) => {
        this.rating = rating;
      });
  }

  ngOnInit() {
    this.vacancyService
      .GetAllOrganizations()
      .subscribe((organizations_notfor_intern) => {
        this.organizations_notfor_intern = organizations_notfor_intern as any[];
        this.organizationInp.icon = 'keyboard_arrow_down';
        this.organizationInp.placeholder = 'Организация';
        this.organizationInp.values = this.compile_values(
          'organization',
          this.organizations_notfor_intern,
          this.orgInpNotIntern
        );
      });
    this.getRating();
    this.constService.GetAllRegions().subscribe((regions) => {
      this.regions = regions as Region[];
      this.selectInputs[inp.REGION].placeholder = 'Регион';
      this.selectInputs[inp.REGION].icon = 'keyboard_arrow_down';
      this.selectInputs[inp.REGION].values = this.compile_values(
        REGION,
        this.regions,
        this.positionFormGroup
      );
    });
    this.constService.GetAllСitizenships().subscribe((countries) => {
      this.countries = countries as Сitizenship[];
      this.selectInputs[inp.COUNTRY].placeholder = 'Гражданство';
      this.selectInputs[inp.COUNTRY].icon = 'keyboard_arrow_down';
      this.selectInputs[inp.COUNTRY].values = this.compile_values(
        COUNTRY,
        this.countries,
        this.positionFormGroup
      );
    });
    this.constService.GetAllCities().subscribe((cities) => {
      this.cities = cities as FullCity[];

      this.selectInputs[inp.CITY].placeholder = 'Город';
      this.selectInputs[inp.CITY].icon = 'keyboard_arrow_down';
      this.selectInputs[inp.CITY].values = this.compile_values(
        CITY,
        this.cities,
        this.positionFormGroup
      );
    });
    this.constService.GetAllUniversities().subscribe((institutes) => {
      this.institutes = institutes as University[];
      this.educations[inpE.INSTITUTE].placeholder =
        'В каком ВУЗе Вы обучаетесь?';
      this.educations[inpE.INSTITUTE].icon = 'keyboard_arrow_down';
      this.educations[inpE.INSTITUTE].values = this.compile_values(
        INSTITUTE,
        this.institutes,
        this.educationFormGroup
      );
    });
    this.constService.GetAllDirections().subscribe((directions) => {
      this.directions = directions as Direction[];
      this.educations[inpE.DIRECTION].placeholder = 'Направление подготовки';
      this.educations[inpE.DIRECTION].icon = 'keyboard_arrow_down';
      this.educations[inpE.DIRECTION].values = this.compile_values(
        DIRECTION,
        this.directions,
        this.educationFormGroup
      );
    });
    this.constService.GetAllCourses().subscribe((courses) => {
      this.courses = courses as Course[];
      this.educations[inpE.COURSE].placeholder = 'Курс';
      this.educations[inpE.COURSE].icon = 'keyboard_arrow_down';
      this.educations[inpE.COURSE].values = this.compile_values(
        COURSE,
        this.courses,
        this.educationFormGroup
      );
    });
    this.vacancyService.GetAllOrganizations().subscribe((organizations) => {
      this.organizations = organizations as Organization[];
      this.favorite_inps[inpF.ORGANIZATION].placeholder = 'Организация';
      this.favorite_inps[inpF.ORGANIZATION].icon = 'keyboard_arrow_down';
      this.favorite_inps[inpF.ORGANIZATION].values = this.compile_values(
        ORGANIZATION,
        this.organizations,
        this.favoriteFormGroup
      );
    });
    this.vacancyService.GetAllBranchs().subscribe((branchs) => {
      this.branchs = branchs as Branch[];
      this.favorite_inps[inpF.BRANCH].placeholder = 'Отрасль';
      this.favorite_inps[inpF.BRANCH].icon = 'keyboard_arrow_down';
      this.favorite_inps[inpF.BRANCH].values = this.compile_values(
        BRANCH,
        this.branchs,
        this.favoriteFormGroup
      );
    });
    this.constService.GetAllSkills().subscribe((skills) => {
      this.allSkills = skills as Skill[];

      this.skill_inp.placeholder = 'Навык';
      this.skill_inp.icon = 'keyboard_arrow_down';
      this.skill_inp.values = this.compile_values(
        SKILL,
        this.allSkills,
        this.skillFormGroup
      );
    });
    this.vacancyService.GetAllTrainingDirections().subscribe((ditections) => {
      this.training_directions = ditections as TrainingDirection[];
      this.training_direction_inp.placeholder = 'Направление';
      this.training_direction_inp.icon = 'keyboard_arrow_down';
      this.training_direction_inp.values = this.compile_values(
        TRAINING_DIRECTION,
        this.training_directions,
        this.interningFormGroup
      );
    });
    this.vacancyService
      .GetAllWorkExperiencies()
      .subscribe((work_experiences) => {
        this.experines = work_experiences as WorkExperience[];
        this.exp_inp.placeholder = 'Опыт работы';
        this.exp_inp.icon = 'keyboard_arrow_down';
        this.exp_inp.values = this.compile_values(
          EXPERIENS,
          this.experines,
          this.experFormGroup
        );
      });
    this.sub = this.profileService.ProfileLoaded.subscribe((profile) => {
      if (this.profileService.profile) {
        this.color = MATCH_COLOR[this.profileService.profile.role.name];
        this.lightColor =
          MATCH_LIGHT_COLOR[this.profileService.profile.role.name];
      }

      this.user = profile;
      this.isMyAccount = true;

      this.mainInfoFormGroup.get(FIRSTNAME)?.setValue(this.user?.firstname);
      this.mainInfoFormGroup.get(LASTNAME)?.setValue(this.user?.lastname);
      this.mainInfoFormGroup.get(PATRONYMIC)?.setValue(this.user?.patronymic);
      this.mainInfoFormGroup.get(DATEBIRTH)?.setValue(this.user?.birthdate);

      this.contactFormGroup.get(PHONE)?.setValue(this.user?.phone);
      this.contactFormGroup.get(EMAIL)?.setValue(this.user?.email);

      this.orgInpNotIntern
        .get(ORGANIZATION)
        ?.setValue(
          this.user?.role.name == MENTOR
            ? this.user?.mentor?.organization?.name
            : this.user?.hr?.organization?.name
        );
      this.genderFlag = this.user?.gender;

      this.positionFormGroup
        .get(REGION)
        ?.setValue(this.user?.city?.region?.name);
      this.positionFormGroup
        .get(COUNTRY)
        ?.setValue(this.user?.citizenship.name);
      this.positionFormGroup.get(CITY)?.setValue(this.user?.city.name);

      this.interningFormGroup
        .get(INTERNSHIP_STATUS)
        ?.setValue(this.user?.intern?.internship_status.name);

      if (this.user && this.user.intern) {
        this.educationFormGroup
          .get(INSTITUTE)
          ?.setValue(this.user?.intern?.university.name);
        this.educationFormGroup
          .get(DIRECTION)
          ?.setValue(this.user?.intern?.direction.name);
        this.educationFormGroup
          .get(COURSE)
          ?.setValue(this.user?.intern?.course.name);

        if (this.user.intern.training_direction)
          this.interningFormGroup
            .get(TRAINING_DIRECTION)
            ?.setValue(this.user.intern.training_direction.name);

        if (this.user.intern.branch)
          this.favoriteFormGroup
            .get(BRANCH)
            ?.setValue(this.user.intern.branch.name);

        if (this.user.intern.organization)
          this.favoriteFormGroup
            .get(ORGANIZATION)
            ?.setValue(this.user.intern.organization.name);

        if (this.user.intern.organizations)
          this.experFormGroup
            .get(ORGANIZATIONS)
            ?.setValue(this.user.intern.organizations);

        if (this.user.intern.work_experience)
          this.experFormGroup
            .get(EXPERIENS)
            ?.setValue(this.user.intern.work_experience.name);

        if (this.user.intern.about_me)
          this.aboutmeControl.setValue(this.user.intern.about_me);
        if (this.user.intern.github)
          this.profilesFormGroup.get(GITHUB)?.setValue(this.user.intern.github);
        if (this.user.intern.vk)
          this.profilesFormGroup.get(VK)?.setValue(this.user.intern.vk);
        if (this.user.intern.url_portfolio)
          this.profilesFormGroup
            .get(PORTFOLIO)
            ?.setValue(this.user.intern.url_portfolio);
      }
    });
    this.profileService.GetProfile();
  }

  ngOnDestroy(): void {
    this.sub.unsubscribe();
  }

  CompileURLImg(url?: string) {
    return this.imageService.CompileURLImg(url);
  }

  isInvalid() {
    let res =
      this.mainInfoFormGroup.invalid ||
      this.positionFormGroup.invalid ||
      this.contactFormGroup.invalid;
    if (this.isIntern()) res = res || this.educationFormGroup.invalid;
    return res;
  }

  removeSkill(skill: SkillIntern) {
    let s = this.userService.DeleteSkill(skill.skill_id).subscribe((res) => {
      s.unsubscribe();
      this.profileService.GetProfile(true);
    });
  }

  verifing() {
    let s = this.userService.VerifyUser().subscribe((res) => {
      s.unsubscribe();
      this.profileService.GetProfile(true);
    });
  }

  selectedSkill() {
    let val = this.skillFormGroup.get(SKILL)?.value;
    let res = fetch_id(this.allSkills, val);
    let s = this.userService.AddSkill(res ? res : val).subscribe((res) => {
      s.unsubscribe();
      this.profileService.GetProfile(true);
      this.skillFormGroup.get(SKILL)?.setValue('');
    });
  }

  saveMainInfo() {
    const { lastname, firstname, patronymic, date_of_birth } =
      this.mainInfoFormGroup.value;
    this.genderFlag;
    const { country, city } = this.positionFormGroup.value;
    const country_id = fetch_id(this.countries, country);
    const city_id = fetch_id(this.cities, city);
    const { phone, email } = this.contactFormGroup.value;
    if (
      lastname != this.user?.lastname ||
      firstname != this.user?.firstname ||
      patronymic != this.user?.patronymic ||
      this.genderFlag != this.user?.gender ||
      date_of_birth != this.user?.birthdate ||
      (country_id && country_id != this.user?.citizenship_id) ||
      (city_id && city_id != this.user?.city_id) ||
      phone != this.user?.phone ||
      email != this.user?.email
    ) {
      const newUser = new UpdateUserModel(
        firstname as string,
        lastname as string,
        patronymic as string,
        new Date(`${date_of_birth}`).getTime(),
        phone as string,
        email as string,
        this.genderFlag as boolean,
        city_id ? city_id : this.user?.city_id,
        country_id ? country_id : this.user?.citizenship_id
      );
      let s = this.userService.UpdateUser(newUser).subscribe(
        (res: any) => {
          s.unsubscribe();
          this.profileService.GetProfile(true);
          if (this.displayChange) showMessage(this._snackBar, res.message);
        },
        (err) => {
          if (Array.isArray(err.error.detail)) {
            if (this.displayChange)
              showMessage(this._snackBar, err.error.detail[0].msg);
          } else if (err.error.detail) {
            if (this.displayChange)
              showMessage(this._snackBar, err.error.detail);
          }
        }
      );
    }
  }

  saveInternInfo() {
    const { training_direction } = this.interningFormGroup.value;
    const { branch, organization } = this.favoriteFormGroup.value;
    const { institute, direction, course } = this.educationFormGroup.value;
    const { github, vk, portfolio } = this.profilesFormGroup.value;
    const aboutme = this.aboutmeControl.value;
    const { experiens, organizations } = this.experFormGroup.value;

    const training_direction_id = fetch_id(
      this.training_directions,
      training_direction
    );
    const branch_id = fetch_id(this.branchs, branch);
    const institute_id = fetch_id(this.institutes, institute);
    const direction_id = fetch_id(this.directions, direction);
    const course_id = fetch_id(this.courses, course);
    const organization_id = fetch_id(this.organizations, organization);
    const experien_id = fetch_id(this.experines, experiens);

    if (
      (training_direction_id &&
        training_direction_id != this.user?.intern?.training_direction_id) ||
      (branch_id && branch_id != this.user?.intern?.branch_id) ||
      (institute_id && institute_id != this.user?.intern?.university_id) ||
      (course_id && course_id != this.user?.intern?.course_id) ||
      (organization_id &&
        organization_id != this.user?.intern?.organization_id) ||
      (direction_id && direction_id != this.user?.intern?.direction_id) ||
      (experien_id && experien_id != this.user?.intern?.work_experience_id) ||
      organizations != this.user?.intern?.organizations ||
      github != this.user?.intern?.github ||
      vk != this.user?.intern?.vk ||
      portfolio != this.user?.intern?.portfolio ||
      aboutme != this.user?.intern?.about_me
    ) {
      this.displayChange = false;
      const newIntern = new UpdateInternModel(
        institute_id ? institute_id : this.user?.intern?.university_id,
        organization_id ? organization_id : this.user?.intern?.organization_id,
        course_id ? course_id : this.user?.intern?.course_id,
        direction_id ? direction_id : this.user?.intern?.direction_id,
        training_direction_id
          ? training_direction_id
          : this.user?.intern?.training_direction_id,
        aboutme as string,
        branch_id ? branch_id : this.user?.intern?.branch_id,
        organizations as string,
        experien_id ? experien_id : this.user?.intern?.work_experience_id,
        github as string,
        vk as string,
        portfolio as string
      );
      let s = this.userService.UpdateIntern(newIntern).subscribe(
        (res: any) => {
          this.displayChange = true;
          s.unsubscribe();
          showMessage(this._snackBar, res.message);
          this.profileService.GetProfile(true);
        },
        (err) => {
          this.displayChange = true;
          if (Array.isArray(err.error.detail)) {
            showMessage(this._snackBar, err.error.detail[0].msg);
          } else if (err.error.detail) {
            showMessage(this._snackBar, err.error.detail);
          }
        }
      );
    }
  }

  onOpenFileDialog(id: string) {
    if (this.isMyAccount) document.getElementById(id)?.click();
  }

  deleteProfile() {
    this.userService.DeleteProfile().subscribe(() => {
      // this.webSocketService.Close();
      if (this.user?.img)
        this.imageService.DeleteOldImage().subscribe((res) => {});
      this.profileService.Logout();
      redirect('/auth/login', this.router, {
        queryParams: {
          message: 'Вы успешно удалили аккаунт!',
        },
      });
    });
  }

  downloadFile(url: any) {
    window.open(this.imageService.compileUrl(url), '_blank');
  }

  filePortChange(event: any) {
    showMessage(this._snackBar, 'Файл загружается');
    let fileList: FileList = event.target.files;
    if (!fileList.length) {
      return;
    }
    let file = fileList[0];
    let s = this.imageService.FileUnloaded.subscribe((data) => {
      s.unsubscribe();
      if (data) {
        this.userService.ChangeFile(data).subscribe(
          (res: any) => {
            s.unsubscribe();
            this.profileService.GetProfile(true);
            if (this.displayChange) showMessage(this._snackBar, res.message);
          },
          (err) => {
            if (Array.isArray(err.error.detail)) {
              if (this.displayChange)
                showMessage(this._snackBar, err.error.detail[0].msg);
            } else if (err.error.detail) {
              if (this.displayChange)
                showMessage(this._snackBar, err.error.detail);
            }
          }
        );
      }
    });
    this.imageService.UnloadFile(file, file.name, true);
  }

  fileImgChange(event: any) {
    this.output = undefined;
    this.photoEditorService
      .open(event, {
        modalMaxWidth: 'min(95%, 400px)',
        modalTitle: 'Фотография на вашей странице',
        applyBtnText: APPLY_BTN_TEXT,
        closeBtnText: CLOSEB_BTN_TEXT,
        aspectRatio: 1 / 1,
        autoCropArea: 1,
      })
      .subscribe((data) => {
        this.output = data;
        if (this.output) {
          let s = this.imageService.FileUnloaded.subscribe((data) => {
            s.unsubscribe();
            if (data) {
              this.userService.ChangeImg(data).subscribe(() => {
                this.profileService.GetProfile(true);
              });
            }
          });
          this.imageService.UnloadFile(this.output.file);
        }
      });
  }

  displayImg() {
    if (this.output) return this.output.base64;
    else return this.imageService.CompileURLImg(this.user?.img);
  }

  saveChange() {
    this.saveMainInfo();
    this.saveInternInfo();
  }

  whiteWithColor() {
    return { 'background-color': this.color, color: WHITE_COLOR };
  }

  colorBorder() {
    return { border: `1px solid ${this.color}` };
  }

  colorLight() {
    return {
      background: this.lightColor,
    };
  }

  colorToggle(flag: boolean) {
    if (flag)
      return {
        'background-color': `${this.color}`,
        color: WHITE_COLOR,
      };
    return {
      color: '#23000d',
      background: WHITE_COLOR,
      border: `1px solid ${this.color}`,
    };
  }
}
