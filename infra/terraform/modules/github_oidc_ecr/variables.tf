variable "github_repo" {
  description = "GitHub repository in format: owner/repo"
  type        = string
}

variable "aws_region" {
  type        = string
  default     = "ap-southeast-1"
}

variable "ecr_repositories" {
  description = "List of ECR repositories to create"
  type        = list(string)
  default     = ["backend", "frontend"]
}

variable "instance_ids" {
  type        = list(string)
  description = "Danh sách EC2 instance IDs được cấp quyền SSM"
}

variable "region" {
  type        = string
  description = "AWS region được dùng trong module"
}
