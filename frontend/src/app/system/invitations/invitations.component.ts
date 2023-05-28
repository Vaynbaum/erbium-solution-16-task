import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';

@Component({
  selector: 'app-invitations',
  templateUrl: './invitations.component.html',
  styleUrls: ['./invitations.component.scss'],
})
export class InvitationsComponent implements OnInit {
  constructor(private route: ActivatedRoute, private router: Router) {}
  ngOnInit(): void {
    this.route.queryParams.subscribe((params: Params) => {
      if (params['vacansions']) {
        this.isClicked = false;
      } else if (params['organizations']) {
        this.isClicked = true;
      }
      if (params['organization_id']) {
        this.organization_id = params['organization_id'];
      }
    });
  }
  isClicked = false;
  nameVac = 'Вакансии';
  nameOrg = 'Организации';
  organization_id: any = null;

  clickVac() {
    this.router.navigate(['/system/invitations'], {
      queryParams: {
        vacansions: true,
      },
    });
  }

  clickOrg() {
    this.router.navigate(['/system/invitations'], {
      queryParams: {
        organizations: true,
      },
    });
  }
  recommend() {
    console.log('нажал!');
  }
}
