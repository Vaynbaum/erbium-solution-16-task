import { Component, OnInit } from '@angular/core';
import { Organization } from 'src/app/shared/models/organization.model';
import { VacancyService } from 'src/app/shared/services/vacancy.service';

interface PlacemarkConstructor {
  geometry: number[];
  properties: ymaps.IPlacemarkProperties;
  options: ymaps.IPlacemarkOptions;
}

@Component({
  selector: 'app-map',
  templateUrl: './map.component.html',
  styleUrls: ['./map.component.scss'],
})
export class MapComponent implements OnInit {
  ngOnInit(): void {

    this.vacancyService.GetAllOrganizations().subscribe(
      (response: any)=>(
        response.forEach(
          (item: any) => {
            let placemark = this.buildPlacemark(
              [item.latitude, item.longitude],
                {balloonContentBody: [
                '<address>',
                `<strong>${item.name}</strong>`,
                '<br/>',
                `Адрес: ${item.address}`,
                '<br/>',
                `<img src="${item.img}">`,
                '<br/>',
                `Подробнее: <a href="http://localhost:4200/system/invitations?vacansions=true&organization_id=${item.id}">Вакансии</a>`,
                '</address>'
            ].join('')},
              {preset: 'islands#dotIcon', iconColor:`${this.randomColor()}`}
              )
            this.placemarks.push(placemark)
          })
        ),
      )
  }
  constructor(private vacancyService: VacancyService) {}
  randomColor = (): string => {
    let result = '';
    for (let i = 0; i < 6; ++i) {
      const value = Math.floor(16 * Math.random());
      result += value.toString(16);
    }
    return '#' + result;
  };
  buildPlacemark(
    geometry: number[],
    properties: ymaps.IPlacemarkProperties,
    options: ymaps.IPlacemarkOptions
  ): PlacemarkConstructor {
    return { geometry: geometry, properties: properties, options: options };
  }
  placemarks: PlacemarkConstructor[] = [];
}
