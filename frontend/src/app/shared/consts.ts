export const NO_CODE = 'Отсутствует уникальный код';
export const INTERN = 'Стажер';
export const CURATOR = 'Куратор';
export const MENTOR = 'Наставник';
export const HR = 'Кадровый специалист';
export let MATCH_COLOR: any = {
  'Кадровый специалист': '#620FCB',
  Наставник: '#0F38CB',
  Куратор: '#B30A3F',
  Стажер: '#079368',
};
export let MATCH_LIGHT_COLOR: any = {
  'Кадровый специалист': '#f7f4fd',
  Наставник: '#f4f6fd',
  Куратор: '#fdf4f7',
  Стажер: '#f4fdfa',
};

export const WHITE_COLOR = '#fff';
export let TABLE_ACCESS_ROUTE: any = {
  invitations: [INTERN],
  map: [INTERN],
  applications: [INTERN, CURATOR, HR, MENTOR],
  selection: [INTERN],
  schedule: [INTERN],
  'need-intern': [CURATOR, HR],
  intern: [CURATOR, HR, MENTOR],
  mentor: [CURATOR, HR],
  statistic: [CURATOR],
  test: [MENTOR],
  control: [MENTOR],
  organiz: [CURATOR],
  school: [MENTOR],
  table: [CURATOR],
  profile: [INTERN, CURATOR, HR, MENTOR],
};

export let LINKS = [
  { title: 'Приглашения', link: 'invitations' },
  { title: 'Карта', link: 'map' },
  { title: 'Заявки', link: 'applications' },
  { title: 'Отбор', link: 'selection' },
  { title: 'Стажировка', link: 'schedule' },
  { title: 'Трек: Карьерная школа', link: 'track' },
  { title: 'Потребность в стажерах', link: 'need-intern' },
  { title: 'Стажеры', link: 'intern' },
  { title: 'Наставники', link: 'mentor' },
  { title: 'Статистика', link: 'statistic' },
  { title: 'Тестирование', link: 'test' },
  { title: 'Управление', link: 'control' },
  { title: 'Организации', link: 'organiz' },
  { title: 'Школа наставников', link: 'school' },
  { title: 'Табель', link: 'table' },
];
