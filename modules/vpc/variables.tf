variable "region" {
  description = "AWS Region to deploy VPC"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}
