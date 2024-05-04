# fastapi-template

## Requirements

- Docker
- Docker Compose
- Rye

## Links

- OpenAPI
    - Swagger UI
        - http://localhost:8000/docs#/
    - ReDoc
        - http://localhost:8000/redoc

## Commands

Run all services
```bash
make up
```

Run tests
```bash
make test
```

Down all services
```bash
make down
```

## あると便利なツール

- DBeaver
    - DB を直接確認するときに使う
- Postman
    - API 呼び出しを行うときに使う
    - ただし、FastAPI は Swagger があるので、そちらを使っても良い