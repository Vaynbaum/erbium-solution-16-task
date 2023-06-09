import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SystemRoutingModule } from './system-routing.module';
import { SharedModule } from '../shared/shared.module';
import { HeaderComponent } from './shared/header/header.component';
import { SystemComponent } from './system.component';
import { FooterComponent } from './shared/footer/footer.component';
import { InvitationsComponent } from './invitations/invitations.component';
import { FormsModule } from '@angular/forms';
import { OrganizationsComponent } from './invitations/organizations/organizations.component';
import { VacansionsComponent } from './invitations/vacansions/vacansions.component';
import { MainPageComponent } from './main-page/main-page.component';
import { ApplicationsComponent } from './applications/applications.component';
import { MapComponent } from './map/map.component';
import { filterResponsesByFileds } from '../shared/pipes/filterResponsesByFileds.pipe';
import { filterVacancyCards } from '../shared/pipes/filterVacancyCards.pipe';
import { filterInterns} from '../shared/pipes/filterInterns.pipe'
import { DialogVacationMoreComponent } from './shared/dialog-vacation-more/dialog-vacation-more.component';
import { ProfileComponent } from './profile/profile.component';
import { AngularYandexMapsModule, YaConfig } from 'angular8-yandex-maps';
import { SelectionComponent } from './selection/selection.component';
import { TestingComponent } from './selection/testing/testing.component';
import { InterviewComponent } from './selection/interview/interview.component';
import { NeedForInternsComponent } from './need-for-interns/need-for-interns.component';
import { InternComponent } from './intern/intern.component';
import { ScheduleComponent } from './schedule/schedule.component';
import { InfoIntershipComponent } from './schedule/info-intership/info-intership.component';
import { MentorComponent } from './mentor/mentor.component';
import { ControlComponent } from './control/control.component';
import { StatisticComponent } from './statistic/statistic.component';
import { MentComponent } from './statistic/ment/ment.component';
import { SelectComponent } from './statistic/select/select.component';
import { TraineeComponent } from './statistic/trainee/trainee.component';
import { VacanComponent } from './statistic/vacan/vacan.component';
import { NgChartsModule } from 'ng2-charts';
import { TimetableComponent } from './schedule/timetable/timetable.component';
import { SelectionCuratorComponent } from './selection/selection-curator/selection-curator.component';
import { TestComponent } from './test/test.component';
import { OrganizComponent } from './organiz/organiz.component';
import { DialogOrganizationAddComponent } from './shared/dialog-organization-add/dialog-organization-add.component';
import { SchoolComponent } from './selection/school/school.component';
import { DialogInfoIntershipAddComponent } from './shared/dialog-info-intership-add/dialog-info-intership-add.component';
import { environment } from 'src/environments/environment';
import { DialogVacationAddComponent } from './shared/dialog-vacation-add/dialog-vacation-add.component';
import { filterSelections } from '../../app/shared/pipes/filterSelections.pipe';
import { filterMentors } from '../../app/shared/pipes/filterMentors.pipe';
import { DialogMailerAddComponent } from './shared/dialog-mailer-add/dialog-mailer-add.component';
import { AllNotificationsComponent } from './all-notifications/all-notifications.component'
import { filterInvitations } from '../shared/pipes/filterInvitations.pipe';
import { GroupByPipe } from '../shared/pipes/notsGroupByDate.pipe';
import { RequestComponent } from './schedule/request/request.component';
import { DialogMakeRequestComponent } from './shared/dialog-make-request/dialog-make-request.component';
const mapConfig: YaConfig = {
  apikey: environment.API_KEY,
  lang: 'ru_RU',
};

@NgModule({
  declarations: [
    SystemComponent,
    HeaderComponent,
    FooterComponent,
    InvitationsComponent,
    OrganizationsComponent,
    VacansionsComponent,
    MainPageComponent,
    ApplicationsComponent,
    MapComponent,
    filterResponsesByFileds,
    filterVacancyCards,
    DialogVacationMoreComponent,
    ProfileComponent,
    SelectionComponent,
    TestingComponent,
    InterviewComponent,
    NeedForInternsComponent,
    InternComponent,
    ScheduleComponent,
    InfoIntershipComponent,
    MentorComponent,
    ControlComponent,
    StatisticComponent,
    MentComponent,
    SelectComponent,
    TraineeComponent,
    VacanComponent,
    TimetableComponent,
    SelectionCuratorComponent,
    TestComponent,
    OrganizComponent,
    DialogOrganizationAddComponent,
    SchoolComponent,
    DialogInfoIntershipAddComponent,
    DialogVacationAddComponent,
    filterInterns,
    filterSelections,
    filterMentors,
    DialogMailerAddComponent,
    AllNotificationsComponent,
    filterInvitations,
    GroupByPipe,
    RequestComponent,
    DialogMakeRequestComponent,
  ],
  imports: [
    CommonModule,
    SystemRoutingModule,
    SharedModule,
    FormsModule,
    AngularYandexMapsModule.forRoot(mapConfig),
    NgChartsModule,
  ],
})
export class SystemModule {}
