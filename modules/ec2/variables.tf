variable "ami_id" {
  description = "AMI ID to use for EC2 instance"
  type        = string
}

variable "key_name" {
  description = "SSH Key Pair name"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g. dev, prod)"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the private subnet"
  type        = string
}

variable "web_sg_id" {
  description = "Security group ID for web server"
  type        = string
}

variable "api_sg_id" {
  description = "Security group ID for API server"
  type        = string
}
