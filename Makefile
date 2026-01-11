```makefile
# Makefile pour Solide Framework

.PHONY: help setup build install test lint clean release

BINARY_NAME=solide
VERSION=$(shell git describe --tags 2>/dev/null || echo "v0.1.0-dev")
BUILD_TIME=$(shell date -u '+%Y-%m-%d_%H:%M:%S')
GO_FILES=$(shell find . -type f -name '*.go' -not -path "./vendor/*")

help: ## Affiche cette aide
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: ## Installe les dépendances et outils
	go mod tidy
	go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
	go install github.com/securego/gosec/v2/cmd/gosec@latest
	@echo "==> Setup complet"

build: ## Build le binaire
	@echo "🔨 Building $(BINARY_NAME) $(VERSION)..."
	CGO_ENABLED=0 go build -ldflags "\
		-X 'main.version=$(VERSION)' \
		-X 'main.buildTime=$(BUILD_TIME)'" \
		-o bin/$(BINARY_NAME) ./cmd/solide

build-all: ## Build pour toutes les plateformes
	mkdir -p dist
	GOOS=linux GOARCH=amd64 make build && mv bin/solide dist/solide-linux-amd64
	GOOS=darwin GOARCH=amd64 make build && mv bin/solide dist/solide-darwin-amd64
	GOOS=darwin GOARCH=arm64 make build && mv bin/solide dist/solide-darwin-arm64
	GOOS=windows GOARCH=amd64 make build && mv bin/solide.exe dist/solide-windows-amd64.exe

install: ## Installe le binaire dans $GOPATH/bin
	go install ./cmd/solide

test: ## Exécute les tests
	@echo "==> lancement des tests..."
	go test -v -race -cover ./...

test-coverage: ## Tests avec couverture
	@echo "==> Exécution des tests avec couverture..."
	go test -v -race -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out -o coverage.html
	@echo "==> Couverture de test générée: coverage.html"

lint: ## Exécute le linter
	@echo "==> Linting code..."
	golangci-lint run ./...

security: ## Analyse de sécurité
	@echo "==> Analyse de sécurité..."
	gosec ./...

clean: ## Nettoie les fichiers de build
	@echo "==> Nettoyage des fichiers de build..."
	rm -rf bin/ dist/ coverage.out coverage.html
	go clean

release: ## Crée une release (nécessite goreleaser)
	@if ! command -v goreleaser >/dev/null; then \
		echo "==> goreleaser non installé. Installer le avec: brew install goreleaser"; \
		exit 1; \
	fi
	goreleaser release --snapshot --clean

docker-build: ## Build l'image Docker
	@echo "==> Creation de l'image docker..."
	docker build -t solide:$(VERSION) -t solide:latest .

docker-run: ## Lance Solide dans Docker
	docker run -p 8080:8080 solide:latest

docs: ## Génère la documentation
	@echo "==> Generation de la documentation..."
	go doc -all ./...

check: ## Vérifie le code avant commit
	make lint
	make test

# Développement
dev: ## Mode développement avec hot reload (nécessite air)
	@if ! command -v air >/dev/null; then \
		echo "==> Installation de air..."; \
		go install github.com/cosmtrek/air@latest; \
	fi
	air

# Version
version: ## Affiche la version
	@echo "Solide Framework $(VERSION)"
	@echo "Built: $(BUILD_TIME)"

# Génération
generate: ## Génère le code
	go generate ./...