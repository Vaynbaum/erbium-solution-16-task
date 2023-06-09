import { VacancyService } from 'src/app/shared/services/vacancy.service';
import { Component, HostListener, OnInit, ViewChild } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatAccordion } from '@angular/material/expansion';
import { createFieldInput } from 'src/app/auth/common';
import { Organization } from 'src/app/shared/models/organization.model';
import { Router } from '@angular/router';
import { ProfileService } from 'src/app/shared/services/profile.service';
@Component({
  selector: 'app-organizations',
  templateUrl: './organizations.component.html',
  styleUrls: ['./organizations.component.scss'],
})
export class OrganizationsComponent implements OnInit {
  constructor(
    private vacancyService: VacancyService,
    private router: Router,
    private profileService: ProfileService
  ) {}
  empty = false;
  organization_cards: Organization[] = [];
  branchs: any;
  b_l = false;
  directions: any;
  b_d = false;
  metros: any;
  b_m = false;
  types: any;
  b_t = false;
  title_type = 'Тип организации';
  title_direction = 'Направление';
  title_branch = 'Род деятельности';
  title_metro = 'Месторасположение';
  title_score = 'Оценка';
  value_score = 1;
  loadedOrg = false;
  isMobile = false;

  mode: any = 'push';
  hasBackdrop: any = false;
  form = new FormGroup({
    search: new FormControl(null),
  });
  //@ts-ignore
  @ViewChild(MatAccordion) accordion: MatAccordion;
  search_type = createFieldInput(this.form, 'Поиск', 'search', 'search');

  formatLabel(value: number): string {
    return `${value}`;
  }

  pr(items: any[]) {
    return items
      .filter((item: any) => {
        return item.checked;
      })
      .map((i: any) => {
        return i.id;
      });
  }

  openVacs(id: number) {
    this.router.navigate(['/system/invitations'], {
      queryParams: {
        vacansions: true,
        organization_id: id,
      },
    });
  }

  dr(items: any[]) {
    items.forEach((item: any) => {
      item.checked = false;
    });
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any) {
    this.isMobile = event.target.innerWidth < 768;
  }

  loadOrgs() {
    this.vacancyService
      .GetAllOganizationWithFilters()
      .subscribe((items: any) => {
        this.organization_cards = items;
        this.loadedOrg = true;
        if (this.organization_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
  }

  ngOnInit(): void {
    this.isMobile = window.innerWidth < 768;
    this.loadOrgs();
    this.vacancyService
      .GetAllTrainingDirections()
      .subscribe((directions: any) => {
        this.directions = directions;
        let res = this.directions.filter((d: any) => {
          return (
            d.id == this.profileService?.profile?.intern?.training_direction_id
          );
        });
        if (res.length > 0) res[0].checked = true;
        this.b_d = true;
      });
    this.vacancyService.GetAllBranchs().subscribe((branchs: any) => {
      this.branchs = branchs;
      let res = this.branchs.filter((b: any) => {
        return b.id == this.profileService?.profile?.intern?.branch_id;
      });
      if (res.length > 0) res[0].checked = true;
      this.b_l = true;
    });
    this.vacancyService.GetAllMetros().subscribe((metros: any) => {
      this.metros = metros;
      this.b_m = true;
    });
    this.vacancyService.GetAllOrganizationTypes().subscribe((types: any) => {
      this.types = types;
      this.b_t = true;
    });
  }

  submit() {
    this.vacancyService
      .GetAllOganizationWithFilters(
        this.pr(this.types),
        this.pr(this.branchs),
        this.pr(this.directions),
        this.value_score
      )
      .subscribe((items: any) => {
        this.organization_cards = items;
        if (this.organization_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
  }
  drop() {
    this.value_score = 0;
    this.dr(this.types);
    this.dr(this.metros);
    this.dr(this.branchs);
    this.dr(this.directions);
    this.empty = false;
    this.loadOrgs();
  }

  onKeyup() {
    this.vacancyService
      .GetAllOganizationWithFilters(
        this.pr(this.types),
        this.pr(this.branchs),
        this.pr(this.directions),
        this.value_score,
        this.form.get('search')?.value
      )
      .subscribe((items: any) => {
        this.organization_cards = items;
        if (this.organization_cards.length == 0) this.empty = true;
        else this.empty = false;
      });
  }
}
