import { Component, OnInit } from '@angular/core';
import { Notification } from 'src/app/shared/models/notification.model';
@Component({
  selector: 'app-all-notifications',
  templateUrl: './all-notifications.component.html',
  styleUrls: ['./all-notifications.component.scss'],
})
export class AllNotificationsComponent implements OnInit {
  constructor() {}
  ngOnInit(): void {}
  nots: Notification[] = [
    {
      id: 1,
      user_id: 3,
      message: 'Вы успешно приняты на стажировку!',
      date: new Date(),
    },
    {
      id: 1,
      user_id: 3,
      message: 'Вы успешно приняты на стажировку!',
      date: new Date(),
    },
  ];
}
