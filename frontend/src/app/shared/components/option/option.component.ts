import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { AbstractControl } from '@angular/forms';
import { forwardRef } from '@angular/core';
import { NG_VALUE_ACCESSOR } from '@angular/forms';
@Component({
  selector: 'app-option',
  templateUrl: './option.component.html',
  styleUrls: ['./option.component.scss'],
  providers: [
    {
      provide: NG_VALUE_ACCESSOR,
      multi: true,
      useExisting: forwardRef(() => OptionComponent),
    },
  ],
})
export class OptionComponent implements OnInit {
  @Input()
  formConrol: AbstractControl | null | undefined | any;
  @Input()
  label: any = '';
  @Input()
  placeholder = '';
  @Input()
  type: string = '';
  @Input()
  icon: any = '';
  @Input()
  values: any;
  @Input()
  messageErorFunc: any = () => {};
  @Input()
  colorBorder: any = null;
  @Input()
  borderRadius: any = '50px';
  @Output() clicked = new EventEmitter<any>();
  constructor() {}

  onClick(option: any) {
    this.clicked.emit(option);
  }

  style() {
    if (this.colorBorder)
      return {
        'border-radius': this.borderRadius,
        border: `1px solid ${this.colorBorder}`,
      };
    else return { 'border-radius': this.borderRadius };
  }

  _value = '';
  get value() {
    return this._value;
  }
  @Input()
  set value(val: string) {
    this._value = val;
    this.onChange(this._value);
  }
  onChange: any = () => {};
  onTouched: any = () => {};
  ngOnInit(): void {}
  writeValue(value: string): void {
    console.log(value);
    this.value = value;
  }
  registerOnChange(fn: any): void {
    console.log(fn);
    this.onChange = fn;
  }
  registerOnTouched(fn: any): void {
    console.log(fn);
    this.onTouched = fn;
  }
  onInput(e: any) {
    this.value = e.target.value;
  }
}
