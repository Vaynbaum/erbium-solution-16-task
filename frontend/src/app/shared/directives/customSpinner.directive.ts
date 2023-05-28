import { Directive, ElementRef, Input } from '@angular/core';

@Directive({
  selector: '[appCustomSpinner]',
})
export class CustomSpinnerDirective {
  @Input() colorSpinner: string | undefined;

  constructor(private elem: ElementRef) {}

  ngAfterViewInit() {
    if (!!this.colorSpinner) {
      const element = this.elem.nativeElement;
      const circle = element.querySelector('circle');
      circle.style.stroke = this.colorSpinner;
    }
  }
}
