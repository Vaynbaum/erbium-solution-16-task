import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Params, Router } from '@angular/router';

@Component({
  selector: 'app-schedule',
  templateUrl: './schedule.component.html',
  styleUrls: ['./schedule.component.scss']
})
export class ScheduleComponent implements OnInit{
  constructor(private route: ActivatedRoute, private router: Router, ) {}
  
  ngOnInit(): void {
    this.route.queryParams.subscribe((params: Params) => {
      if (params['testing']) {
        this.isClicked['testing'] = true;
        this.isClicked['interview'] = false;
        this.isClicked['school'] = false;
        this.isClicked['case'] = false;
        this.isClicked['request'] = false;
      } else if (params['interview']) {
        this.isClicked['testing'] = false;
        this.isClicked['interview'] = true;
        this.isClicked['school'] = false;
        this.isClicked['case'] = false;
        this.isClicked['request'] = false;
      } else if (params['school']) {
        this.isClicked['testing'] = false;
        this.isClicked['interview'] = false;
        this.isClicked['school'] = true;
        this.isClicked['case'] = false;
        this.isClicked['request'] = false;
      }  else if (params['case']) {
        this.isClicked['testing'] = false;
        this.isClicked['interview'] = false;
        this.isClicked['school'] = false;
        this.isClicked['case'] = true;
        this.isClicked['request'] = false;
      }
      else if (params['request']){
        this.isClicked['testing'] = false;
        this.isClicked['interview'] = false;
        this.isClicked['school'] = false;
        this.isClicked['case'] = false;
        this.isClicked['request'] = true;
      }
    });

  }
  mode: any = 'push';
  hasBackdrop: any = false;
  isClicked = {'interview': false, 'school': false, 'testing': true, 'case': false, 'request': false};
  clickTest(){
    this.router.navigate(['/system/schedule'], {
      queryParams: {
        testing: true,
      },
    });
  }
  clickInter(){
    this.router.navigate(['/system/schedule'], {
      queryParams: {
        interview: true,
      },
    });
  }
  clickSchool(){
    this.router.navigate(['system/schedule'], 
    {
      queryParams: {
        school: true,
      },
    })
  }
  clickCase(){
    this.router.navigate(['system/schedule'], {
      queryParams: {
        case: true,
      },
    })
  }
  clickRequest(){
    this.router.navigate(['system/schedule'], {
      queryParams: {
        request: true,
      },
    })
  }

}
