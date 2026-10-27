.PHONY: dev prod obs up down logs clean help

help:
	@echo "Available targets:"
	@echo "  make dev    - Run stack with dev profile (live reload)"
	@echo "  make prod   - Run production stack without dev overrides"
	@echo "  make obs    - Run observability profile (Dozzle & cAdvisor)"
	@echo "  make up     - Bring up default base stack"
	@echo "  make down   - Stop and remove containers across all profiles"
	@echo "  make logs   - Tail logs from active containers"
	@echo "  make clean  - Stop all profiles and remove all named volumes"

dev:
	docker compose --profile dev up -d --build

prod:
	docker compose -f docker-compose.yml up -d --build

obs:
	docker compose --profile obs up -d

up:
	docker compose up -d --build

down:
	docker compose --profile '*' down

logs:
	docker compose logs -f

clean:
	docker compose --profile '*' down -v --remove-orphans
