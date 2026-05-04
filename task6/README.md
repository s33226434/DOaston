# Kanban Docker Deployment

## Репозитории

- Backend: [https://github.com/s33226434/docker-backend](https://github.com/s33226434/docker-backend)
- Frontend: [https://github.com/s33226434/docker-frontend](https://github.com/s33226434/docker-frontend)
- Task 6 (данный репозиторий): [https://github.com/s33226434/docker-task6](https://github.com/s33226434/docker-task6)

### Backend
`cd ../kanban-backend && docker build -t my-backend .`

### Frontend
`cd ../kanban-frontend && docker build -t my-frontend .`


### Простая версия (один фронтенд)
`docker compose up -d`

### Версия с балансировщиком (два фронтенда)
`docker compose -f docker-compose-advanced.yml up -d`

## Доступ

- Frontend: [http://localhost:8080](http://localhost:8080)
- Backend API: [http://localhost:8081/api/actuator/health](http://localhost:8081/api/actuator/health)

## Остановка

`docker compose down`  
`docker compose -f docker-compose-advanced.yml down`
