terraform {
  required_version = ">= 1.5.0"
}

variable "service_name" {
  description = "Logical owner of the database"
  type        = string
}

variable "instance_size" {
  description = "Database instance size"
  type        = string
  default     = "small"
}

output "connection_string" {
  description = "PostgreSQL connection string"
  value       = "postgresql://${var.service_name}:password@${var.service_name}-db:5432/${var.service_name}"
}
