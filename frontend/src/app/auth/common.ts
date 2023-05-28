import { FormGroup } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Input } from 'src/app/shared/models/input.model';

export const REGION = 'region';
export const CITY = 'city';
export const INSTITUTE = 'institute';
export const COURSE = 'course';
export const COUNTRY = 'country';
export const DIRECTION = 'direction';
export const PASSWORD = 'password';
export const EMAIL = 'email';
export const NAME = 'text';
export const TEL = 'tel';
export const OPTION = 'option';
export const DATE = 'date';
export const FIRSTNAME = 'firstname';
export const LASTNAME = 'lastname';
export const PATRONYMIC = 'patronymic';
export const PHONE = 'phone';
export const DATEBIRTH = 'date_of_birth';
export const TRAINING_DIRECTION = 'training_direction';
export const INTERNSHIP_STATUS = 'internship_status';
export const BRANCH = 'branch';
export const ORGANIZATION = 'organization';
export const GITHUB = 'github';
export const VK = 'vk';
export const PORTFOLIO = 'portfolio';
export const SKILL = 'skill';
export const EXPERIENS = 'experiens';
export const ORGANIZATIONS = 'organizations';

const OK = 'ОК';
const DURATION_MESSAGE = 5000;

export function createEmailInput(form: FormGroup, label?: string) {
  return {
    type: EMAIL,
    icon: 'email',
    label: label,
    placeholder: 'Введите e-mail',
    messageError: () => {
      if (form.get?.(EMAIL)?.['errors']?.['required']) {
        return 'Email не может быть пустым';
      }
      if (form.get?.(EMAIL)?.['errors']?.[EMAIL]) {
        return 'Введите корректный email';
      }
      return '';
    },
    formControl: form.get?.(EMAIL),
  } as Input;
}

export function createPasswordInput(
  form: FormGroup,
  label = 'Введите пароль',
  form_elem = 'password'
) {
  return {
    type: PASSWORD,
    icon: 'key',
    placeholder: label,
    hide: true,
    messageError: () => {
      if (form.get?.(form_elem)?.['errors']?.['required']) {
        return 'Пароль не может быть пустым';
      }
      if (
        form.get?.(form_elem)?.['errors']?.['minlength'] &&
        form.get?.(form_elem)?.['errors']?.['minlength']['requiredLength']
      )
        return `Пароль должен быть больше ${
          form.get(form_elem)?.['errors']?.['minlength']?.['requiredLength']
        } символов`;
      if (form?.get?.(form_elem)?.['errors']?.['passwordNotMatch']) {
        return 'Пароли не совпадают';
      }
      return '';
    },
    formControl: form.get?.(form_elem),
  } as Input;
}

export function createFieldInput(
  form: FormGroup,
  placeholder: string,
  form_elem: string,
  icon: string = 'person_outline',
  label: string = '',
  type: string = NAME
) {
  return {
    type: type,
    icon: icon,
    placeholder: placeholder,
    messageError: () => {
      if (form.get?.(form_elem)?.['errors']?.['required']) {
        return `${placeholder} не может быть пустым`;
      }
      return '';
    },
    formControl: form.get?.(form_elem),
    label: label,
  } as Input;
}

export function createPhoneInput(
  form: FormGroup,
  placeholder: string,
  form_elem: string,
  label?: string
) {
  return {
    type: TEL,
    icon: 'phone_enabled',
    label: label,
    placeholder: placeholder,
    messageError: () => {
      if (form.get?.(form_elem)?.['errors']?.['required']) {
        return `${placeholder} не может быть пустым`;
      }
      return '';
    },
    formControl: form.get?.(form_elem),
  } as Input;
}
export function get_current_age(date: Date) {
  return (
    ((new Date().getTime() - new Date(date).getTime()) /
      (24 * 3600 * 365.25 * 1000)) |
    0
  );
}
export function fetch_id(values: any[], val: any) {
  let res = values.filter((i) => {
    return i.name == val;
  });
  return res.length > 0 ? res[0].id : null;
}
export function createDateInput(
  form: FormGroup,
  placeholder: string,
  form_elem: string,
  valid_label: string,
  label?: string
) {
  return {
    type: DATE,
    icon: 'calendar_today',
    placeholder: placeholder,
    label: label,
    messageError: () => {
      if (form.get?.(form_elem)?.['errors']?.['required']) {
        return `${valid_label} не может быть пустой`;
      }
      return '';
    },
    formControl: form.get?.(form_elem),
  } as Input;
}

export function createOptionInput(
  form: FormGroup,
  label: string,
  form_elem: string
) {
  return {
    type: OPTION,
    icon: 'expand_more',
    placeholder: label,
    messageError: () => {
      if (form.get?.(form_elem)?.['errors']?.['required']) {
        return `Выберите параметр`;
      }
      return '';
    },
    formControl: form.get?.(form_elem),
  } as Input;
}

export function showMessage(snackBar: MatSnackBar, text: string) {
  snackBar.open(text, OK, {
    horizontalPosition: 'center',
    verticalPosition: 'top',
    duration: DURATION_MESSAGE,
  });
}

export function redirect(link: string, router: Router, obj?: any) {
  router.navigate([link], obj);
}
