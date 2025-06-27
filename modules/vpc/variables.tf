variable "region" {
  description = "AWS Region to deploy VPC"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet (zone a)"
  default     = "10.0.2.0/24"
}

variable "private_c_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet (zone c)"
  default     = "10.0.3.0/24"
}
