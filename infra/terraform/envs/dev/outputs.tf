output "dev_web_public_ip" {
  value       = module.ec2.web_eip
  description = "Public IP of web server (dev)"
}

output "dev_api_private_ip" {
  value       = module.ec2.api_private_ip
  description = "Private IP of API server (dev)"
}

output "dev_rds_endpoint" {
  value       = module.rds.rds_endpoint
  description = "RDS endpoint (dev)"
}

output "dev_bastion_public_ip" {
  value       = module.ec2.bastion_public_ip
  description = "Public IP of Bastion host (dev)"
}
