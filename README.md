# erbium-solution-16-task
Решения хакатона `Лидеры Цифровой Трансформации 2023` в кейсе `интерактивная платформа-сообщество для стажеров и участников молодежных карьерных проектов`
<h2><a href="https://ltc-front.vercel.app/">Демо</a></h2>

### Тестовые аккаунты

```
Стажер
romanova@mail.ru
12567788

Наставник
volkov@mail.ru
12567788

HR
burova@mail.ru
12567788

Куратор
kurskaya@mail.ru
12567788
```

## Как это выглядит
### Стажер
профиль

<img width="600" src="https://github.com/user-attachments/assets/a14fca06-7cd1-43d9-af9b-e36a3ca078d9">

страница вакансий

<img width="600" src="https://github.com/user-attachments/assets/49f98bda-7382-41ce-9823-d9d08533a13c">

карта с организациями

<img width="600" src="https://github.com/user-attachments/assets/fefb7152-1b0d-4b64-8c56-2a5509039af6">

### Наставник
страница стажеров

<img width="600" src="https://github.com/user-attachments/assets/422905f3-8c4d-4ec0-ba9e-bd2bc819402e">

страница откликов

<img width="600" src="https://github.com/user-attachments/assets/6cdf4782-d013-4976-b903-e6254d798def">

### HR
страница "Потребность в стажерах"

<img width="600" src="https://github.com/user-attachments/assets/f98fc6a2-2e79-426f-a337-5c04ab8b022d">

страница наставников

<img width="600" src="https://github.com/user-attachments/assets/60af8fd8-b0c1-4dd8-9c48-c88820464770">

### Куратор

страница статистики

<img width="600" src="https://github.com/user-attachments/assets/f4b8eb77-936e-4af8-9c85-d99a9583ed8d">

страница организаций

<img width="600" src="https://github.com/user-attachments/assets/6548fbad-bce6-4261-be86-87dae4cf4b34">

## Запуск проекта
Перед запуском необходимо: 
1. В файле `.env` в корне проекта изменить переменные `XXXXXX`
* `EMAIL_SENDER` и `PASSWORD` для отправки писем на почты
* `DETA_PROJECT_KEY` и `DETA_NAME_DRIVE` для загрузки файлов на платформу DETA
* `SECRET_STRING` для JWT-токенов. С помощью BASH можно сгенирировать командой 
```bash 
openssl rand -hex 32
```
* `POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`, `HOST`, `PORT` для SQL БД
2. В файлах `environment.development.ts` и `environment.ts` в директории `/frontend/src/environments` задать API_KEY для API Яндекс.Карт

Для запуска проекта необходим docker. В консоли в директории с проектом вводим команду
```
docker-compose up
```
Переходим по ссылке:
http://localhost

## При регистрации, авторизации, востановления пароля и в других случаях письмо, отправленное на реальную электронную почту может попасть в СПАМ!
