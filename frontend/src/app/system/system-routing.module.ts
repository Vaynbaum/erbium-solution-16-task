import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SystemComponent } from './system.component';
import { InvitationsComponent } from './invitations/invitations.component';
import { MainPageComponent } from './main-page/main-page.component';
import { MapComponent } from './map/map.component';
import { ApplicationsComponent } from './applications/applications.component';
import { ProfileComponent } from './profile/profile.component';
import { SelectionComponent } from './selection/selection.component';
import { NeedForInternsComponent } from './need-for-interns/need-for-interns.component';
import { InternComponent } from './intern/intern.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { MentorComponent } from './mentor/mentor.component';
import { ControlComponent } from './control/control.component';
import { StatisticComponent } from './statistic/statistic.component';
import { TestComponent } from './test/test.component';
import { OrganizComponent } from './organiz/organiz.component';
import { AllNotificationsComponent } from './all-notifications/all-notifications.component';
import { AuthGuard } from '../shared/guards/auth.guard';

const routes: Routes = [
  {
    path: '',
    component: SystemComponent,
    canActivate: [AuthGuard],
    children: [
      { path: 'invitations', component: InvitationsComponent },
      { path: 'main-page', component: MainPageComponent },
      { path: 'map', component: MapComponent },
      { path: 'applications', component: ApplicationsComponent },
      { path: 'profile', component: ProfileComponent },
      { path: 'selection', component: SelectionComponent },
      { path: 'need-intern', component: NeedForInternsComponent},
      { path: 'intern', component: InternComponent},
      { path: 'schedule', component: ScheduleComponent},
      { path: 'mentor', component: MentorComponent},
      { path: 'control', component: ControlComponent},
      { path: 'statistic', component: StatisticComponent},
      { path: 'test', component: TestComponent},
      { path: 'organiz', component: OrganizComponent},
      { path: 'all_nots', component: AllNotificationsComponent}
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class SystemRoutingModule {}
