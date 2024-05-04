.PHONY: test
test:
	rye run pytest -v -vv --cov=src/tempapp --cov-report=term-missing --cov-report=html tests

.PHONY: fmt
fmt:
	rye run ruff format

.PHONY: lint
lint:
	rye run ruff check

.PHONY: fix
fix:
	rye run ruff check --fix

.PHONY: up
up:
	docker compose up -d

.PHONY: down
down:
	docker compose down