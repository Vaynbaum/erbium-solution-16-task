# erbium-solution-16-task
Решения хакатона `Лидеры Цифровой Трансформации 2023` в кейсе `интерактивная платформа-сообщество для стажеров и участников молодежных карьерных проектов`
<h2><a href="https://ltc-front.vercel.app/">Демо</a></h2>

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
