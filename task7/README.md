task7/
├── docker-compose.yml      # Основной конфиг
├── nginx.conf              # Конфиг Nginx (HTTPS + прокси)
├── ssl/
│   ├── app.local.key       # Приватный ключ
│   └── app.local.crt       # Самоподписанный сертификат
├── loki-config.yml         # Конфиг Loki
├── promtail-config.yml     # Конфиг Promtail
├── prometheus.yml          # Конфиг Prometheus
└── README.md               # Этот файл


## Сервисы

| Сервис | Назначение | Порт |
|--------|------------|------|
| `kanban-postgres` | База данных PostgreSQL 11 | 5432 (внутренний) |
| `backend` | Spring Boot приложение | 8080 (внутренний) |
| `frontend` | Angular 7 на Nginx | 8080 (внутренний) |
| `nginx` | Точка входа, HTTPS, проксирование | 80, 443 |
| `loki` | Централизованный сбор логов | 3100 |
| `promtail` | Агент сбора логов Docker | — |
| `prometheus` | Сбор метрик | 9090 |

## Особенности

### Nginx
- Единая точка входа для frontend и backend
- HTTPS с самоподписанным сертификатом
- Проксирование: `/` → frontend, `/api/` → backend
- Редирект HTTP → HTTPS

### Очерёдность старта
Строгая цепочка зависимостей через `depends_on` с `condition: service_healthy`: