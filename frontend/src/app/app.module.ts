import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { environment } from '../environments/environment';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from './shared/shared.module';
import { AuthModule } from './auth/auth.module';
import { AuthService } from './shared/services/auth.service';
import { CookieService } from './shared/services/cookie.service';
import { UserService } from './shared/services/user.service';
import { NotFoundPageComponent } from './not-found-page/not-found-page.component';
import { ConstService } from './shared/services/const.service';
import { VacancyService } from './shared/services/vacancy.service';
import { ImageService } from './shared/services/image.service';
import { ProfileService } from './shared/services/profile.service';
import { NgxPhotoEditorModule } from 'ngx-photo-editor';
import { NgChartsModule } from 'ng2-charts';
import { AuthGuard } from './shared/guards/auth.guard';

@NgModule({
  declarations: [AppComponent, NotFoundPageComponent],
  imports: [
    BrowserModule,
    AuthModule,
    AppRoutingModule,
    SharedModule,
    BrowserAnimationsModule,
    NgxPhotoEditorModule,
    NgChartsModule,
  ],
  providers: [
    AuthService,
    CookieService,
    AuthGuard,
    UserService,
    ConstService,
    VacancyService,
    ImageService,
    ProfileService,
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
