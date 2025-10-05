PNPM?=pnpm
HELM?=helm
TERRAFORM?=terraform

install:
$(PNPM) install

lint:
$(PNPM) lint

test:
$(PNPM) test

build:
$(PNPM) build

docker-build:
$(PNPM) docker:build

helm-lint:
$(PNPM) helm:lint

terraform-init:
cd infra/terraform/environments/dev && $(TERRAFORM) init

terraform-plan:
cd infra/terraform/environments/dev && $(TERRAFORM) plan

.PHONY: install lint test build docker-build helm-lint terraform-init terraform-plan
