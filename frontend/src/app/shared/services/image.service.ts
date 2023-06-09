import { HttpClient } from '@angular/common/http';
import { EventEmitter, Injectable, Output } from '@angular/core';
import { AuthService } from './auth.service';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
const URL='local'
@Injectable({
  providedIn: 'root',
})
export class ImageService {
  constructor(
    private httpClient: HttpClient,
    private authService: AuthService
  ) {}
  @Output() FileUnloaded = new EventEmitter();
  CompileURLImg(url?: string) {
    if (url) {
      if (url.includes('http')) {
        return url;
      } else {
        return `${URL}/${url}`;
      }
    } else {
      return `${environment.IMAGES_URL}/no-camera.png`;
    }
  }

  unloadFile(
    token: string,
    formData: FormData,
    filename?: string,
    portfolio?: boolean,
    name_type?: string
  ) {
    let url = `${URL}/`;
    let f = false;
    if (filename) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `filename=${filename}&`;
    }
    if (portfolio) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `portfolio=${portfolio}&`;
    }
    if (name_type) {
      if (!f) {
        url += '?';
        f = true;
      }
      url += `name_type=${name_type}&`;
    }
    return this.httpClient.post(url, formData, {
      headers: {
        Authorization: `Bearer ${token}`,
      },
    });
  }
  validURL(url?: string) {
    if (url) {
      if (url.includes('http')) {
        return url;
      } else {
        return null;
      }
    }
    return null;
  }

  compileUrlTask(url: string) {
    return `${URL}/${url}`;
  }

  compileUrl(url: string) {
    return `${URL}/${url}`;
  }
  UnloadFile(
    fileImg: any,
    filename?: string,
    portfolio?: boolean,
    name_type?: string
  ) {
    let formData = new FormData();
    formData.append('file', fileImg);

    let s = this.unloadFile(
      this.authService.GetAccessToken(),
      formData,
      filename,
      portfolio,
      name_type
    ).subscribe(
      (data) => {
        s.unsubscribe();
        this.FileUnloaded.emit(data);
      },
      (err) => {
        if (err.status === 401 || err.status === 403) {
          let sub = this.authService.TokenRefreshed.subscribe(() => {
            sub.unsubscribe();
            let s = this.unloadFile(
              this.authService.GetAccessToken(),
              formData,
              filename,
              portfolio,
              name_type
            ).subscribe(
              (data) => {
                s.unsubscribe();
                this.FileUnloaded.emit(data);
              },
              (err) => {
                this.FileUnloaded.emit(null);
              }
            );
          });
          this.authService.RefreshToken();
        }
      }
    );
  }

  private deleteOldImage(token: string, img?: string) {
    let url = environment.BACKEND_URL_FILE;
    if (img) url += `?filename=${img}`;
    return this.httpClient.delete(url, {
      headers: { Authorization: `Bearer ${token}` },
    });
  }

  DeleteOldImage(img?: string) {
    return new Observable((observer) => {
      this.deleteOldImage(this.authService.GetAccessToken(), img).subscribe(
        (response) => {
          observer.next(response);
        },
        (err) => {
          if (err.status === 401 || err.status === 403) {
            this.authService.RefreshToken();
            let sub = this.authService.TokenRefreshed.subscribe(() => {
              sub.unsubscribe();
              this.deleteOldImage(
                this.authService.GetAccessToken(),
                img
              ).subscribe(
                (response) => observer.next(response),
                (err) => observer.next(err)
              );
            });
          }
        }
      );
    });
  }
}
