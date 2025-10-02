terraform {
  required_version = ">= 1.5.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4"
    }
  }
}

provider "local" {}

module "network" {
  source    = "../../modules/network"
  cidr_block = "10.51.0.0/16"
}

module "redis" {
  source    = "../../modules/redis"
  namespace = "drivershub-dev"
}

module "kafka" {
  source = "../../modules/kafka"
}

locals {
  services = ["identity", "drivers", "partners", "orders", "wallet"]
}

resource "local_file" "service_databases" {
  count    = length(local.services)
  filename = "${path.module}/${local.services[count.index]}-db.txt"
  content  = module.network.network_id
}

output "postgresql" {
  value = { for name in local.services : name => "postgresql://${name}:${name}@${name}-db:5432/${name}" }
}

output "redis_url" {
  value = module.redis.redis_url
}

output "kafka" {
  value = {
    bootstrap = module.kafka.bootstrap_servers
    topics    = module.kafka.topics
  }
}
