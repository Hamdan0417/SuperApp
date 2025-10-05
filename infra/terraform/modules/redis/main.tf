terraform {
  required_version = ">= 1.5.0"
}

variable "namespace" {
  description = "Namespace for redis logical grouping"
  type        = string
}

output "redis_url" {
  description = "Redis connection string"
  value       = "redis://${var.namespace}-redis:6379/0"
}
