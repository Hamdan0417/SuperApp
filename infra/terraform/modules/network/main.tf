terraform {
  required_version = ">= 1.5.0"
}

variable "cidr_block" {
  description = "CIDR block for the VPC or virtual network"
  type        = string
  default     = "10.50.0.0/16"
}

output "network_id" {
  description = "Placeholder network identifier"
  value       = "network-placeholder"
}
