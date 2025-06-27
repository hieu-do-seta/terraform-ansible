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
