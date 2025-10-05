terraform {
  required_version = ">= 1.5.0"
}

variable "cluster_name" {
  description = "Kafka cluster name"
  type        = string
  default     = "drivershub-dev"
}

output "bootstrap_servers" {
  description = "Kafka bootstrap servers"
  value       = "${var.cluster_name}:9092"
}

output "topics" {
  description = "Default topics"
  value = [
    "orders.offered",
    "orders.status",
    "drivers.status",
    "payouts.created"
  ]
}
