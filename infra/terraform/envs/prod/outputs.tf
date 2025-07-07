output "prod_web_public_ip" {
  value = module.ec2.web_eip
}

output "prod_api_private_ip" {
  value = module.ec2.api_private_ip
}

output "prod_rds_endpoint" {
  value = module.rds.rds_endpoint
}

output "prod_bastion_public_ip" {
  value = module.ec2.bastion_public_ip
}

output "aws_account_id" {
  description = "AWS Account ID để dùng trong CI/CD hoặc ECR registry"
  value       = data.aws_caller_identity.current.account_id
}

output "aws_region" {
  description = "AWS Region đang triển khai"
  value       = var.region
}

output "ecr_registry_uri" {
  description = "ECR registry URI chuẩn cho push/pull"
  value       = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}

output "AWS_ROLE_ARN" {
  description = "ARN của IAM Role cho GitHub Actions OIDC"
  value       = module.github_oidc_ecr.role_arn
}

output "frontend_instance_id" {
  description = "EC2 instance ID của frontend (public web/nginx)"
  value       = module.ec2.frontend_instance_id
}

output "backend_instance_id" {
  description = "EC2 instance ID của backend (API server)"
  value       = module.ec2.backend_instance_id
}

output "bastion_instance_id" {
  description = "EC2 instance ID của bastion"
  value       = module.ec2.bastion_instance_id
}


