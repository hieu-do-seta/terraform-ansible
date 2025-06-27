variable "vpc_id" {
  description = "VPC ID to attach security groups to"
  type        = string
}

variable "environment" {
  description = "Deployment environment (dev/prod)"
  type        = string
}

variable "ssh_ingress_cidr" {
  type        = list(string)
  description = "Allowed CIDR blocks for SSH access"
  default     = ["0.0.0.0/0"]
}

variable "http_ingress_cidr" {
  type        = list(string)
  description = "Allowed CIDR blocks for HTTP access"
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr" {
  type        = list(string)
  description = "CIDR blocks allowed for outbound traffic"
  default     = ["0.0.0.0/0"]
}
