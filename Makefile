.PHONY: help install test analyze format format-check deploy deploy-dry-run clean example

help: ## Show this help message
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies
	flutter pub get

test: ## Run all tests
	flutter test

analyze: ## Run static analysis
	flutter analyze

format: ## Format code
	dart format .

format-check: ## Check if code is formatted correctly
	dart format --set-exit-if-changed .

deploy-dry-run: ## Validate package before publishing
	flutter pub publish --dry-run || [ $$? -eq 65 ]

deploy: ## Publish package to pub.dev
	flutter pub publish

clean: ## Clean build artifacts
	flutter clean

example: ## Run example app
	cd example && flutter pub get && flutter run
