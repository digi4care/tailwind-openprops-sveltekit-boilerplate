.PHONY: help
help: ## Show this help
	@echo "Svelte CLI Commands"
	@echo "=================="
	@echo "Usage: make <command>"
	@echo ""
	@echo "Project Management:"
	@echo "  make create           Create a new Svelte project"
	@echo "  make create-minimal   Create a new Svelte project (minimal with TypeScript)"
	@echo "  make create-demo      Create a new Svelte project (demo with TypeScript)"
	@echo "  make create-library   Create a new Svelte project (library with TypeScript)"
	@echo "  make add              Add an add-on (e.g., make add pkg=tailwindcss)"
	@echo "  make setup            Install dependencies"
	@echo ""
	@echo "Development:"
	@echo "  make dev              Start development server"
	@echo "  make build            Build for production"
	@echo "  make preview          Preview production build"
	@echo "  make check            Check your Svelte project for errors"
	@echo ""
	@echo "Testing:"
	@echo "  make test             Run tests"
	@echo "  make test-watch       Run tests in watch mode"
	@echo "  make test-coverage    Generate test coverage"
	@echo ""
	@echo "Code Quality:"
	@echo "  make lint             Run linter"
	@echo "  make format           Format code"
	@echo "  make typecheck        Check types"
	@echo ""
	@echo "Database:"
	@echo "  make db-up            Start database container"
	@echo "  make db-down          Stop database container"
	@echo "  make db-migrate       Run database migrations"
	@echo ""
	@echo "Migrations:"
	@echo "  make migrate          Run available migrations"
	@echo "  make migrate-svelte5  Migrate to Svelte 5"
	@echo "  make migrate-kit2     Migrate to SvelteKit 2"
	@echo "  make migrate-appstate Migrate app state"
	@echo "  make migrate-package  Migrate package"
	@echo "  make migrate-routes   Migrate routes"
	@echo ""
	@echo "Add-ons:"
	@echo "  make add-drizzle      Add Drizzle ORM"
	@echo "  make add-eslint       Add ESLint"
	@echo "  make add-lucia        Add Lucia authentication"
	@echo "  make add-mdsvex       Add mdsvex (Markdown)"
	@echo "  make add-playwright   Add Playwright tests"
	@echo "  make add-prettier     Add Prettier"
	@echo "  make add-storybook    Add Storybook"
	@echo "  make add-tailwind     Add Tailwind CSS"
	@echo "  make add-vitest       Add Vitest"
	@echo "  make add-paraglide    Add paraglide i18n"
	@echo ""
	@echo "Maintenance:"
	@echo "  make clean            Remove node_modules and build files"
	@echo "  make update           Update all dependencies"

# Project setup
create-minimal:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Usage: make $@ projectname"; \
		exit 1; \
	fi
	@echo "Creating a new Svelte project in $(word 2, $(MAKECMDGOALS)) (minimal template)"
	npx sv create $(word 2, $(MAKECMDGOALS)) --template=minimal --types=typescript

create-demo:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Usage: make $@ projectname"; \
		exit 1; \
	fi
	@echo "Creating a new Svelte project in $(word 2, $(MAKECMDGOALS)) (demo template)"
	npx sv create $(word 2, $(MAKECMDGOALS)) --template=demo --types=typescript

create-library:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Usage: make $@ projectname"; \
		exit 1; \
	fi
	@echo "Creating a new Svelte project in $(word 2, $(MAKECMDGOALS)) (library template)"
	npx sv create $(word 2, $(MAKECMDGOALS)) --template=library --types=typescript

create:
	@if [ -z "$(filter-out $@,$(MAKECMDGOALS))" ]; then \
		echo "Usage: make create projectname"; \
		exit 1; \
	fi
	@echo "Creating a new Svelte project in $(word 2, $(MAKECMDGOALS))"
	npx sv create $(word 2, $(MAKECMDGOALS))

# Handle arguments as non-targets
%:
	@:

check:
	npx sv check

setup:
	npm install

# Development
dev:
	npm run dev

build:
	npm run build

preview:
	npm run preview

# Testing
test:
	npm test

test-watch:
	npm run test:watch

test-coverage:
	npm run test:coverage

# Code Quality
lint:
	npm run lint

format:
	npm run format

typecheck:
	npm run check

# Database
db-up:
	docker-compose up -d

db-down:
	docker-compose down

db-migrate:
	npx drizzle-kit migrate

# Migrations
migrate:
	npx sv migrate

migrate-svelte5:
	npx sv migrate svelte-5

migrate-kit2:
	npx sv migrate sveltekit-2

migrate-appstate:
	npx sv migrate app-state

migrate-package:
	npx sv migrate package

migrate-routes:
	npx sv migrate routes

# Add-ons
add:
	@if [ -z "$(pkg)" ]; then \
		echo "Specify a package: make add pkg=package-name"; \
		exit 1; \
	fi
	npx sv add $(pkg)

add-drizzle:
	npx sv add drizzle

add-eslint:
	npx sv add eslint

add-lucia:
	npx sv add lucia

add-mdsvex:
	npx sv add mdsvex

add-playwright:
	npx sv add playwright

add-prettier:
	npx sv add prettier

add-storybook:
	npx sv add storybook

add-tailwind:
	npx sv add tailwindcss

add-vitest:
	npx sv add vitest

add-paraglide:
	npx sv add paraglide

# Maintenance
clean:
	rm -rf node_modules .svelte-kit build

update:
	npm update