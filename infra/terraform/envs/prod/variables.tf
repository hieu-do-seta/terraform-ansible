variable "region" {
  description = "AWS region to deploy into"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "db_username" {
  description = "Username for RDS database"
  type        = string
}

variable "db_password" {
  description = "Password for RDS database"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "github_repo" {
  type        = string
  description = "Tên repository GitHub (owner/repo)"
}

variable "ecr_repositories" {
  type        = list(string)
  description = "Danh sách tên các ECR repositories sẽ tạo"
}
