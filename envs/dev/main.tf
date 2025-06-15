provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"
  region = var.region
  environment = var.environment
}

module "security_group" {
  source = "../../modules/security_group"
  vpc_id = module.vpc.vpc_id
  environment = var.environment
}

module "ec2" {
  source = "../../modules/ec2"
  ami_id = var.ami_id
  key_name = var.key_name
  environment = var.environment
  public_subnet_id = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  web_sg_id = module.security_group.web_sg_id
  api_sg_id = module.security_group.api_sg_id
}

module "rds" {
  source             = "../../modules/rds"
  db_username        = var.db_username
  db_password        = var.db_password
  private_subnet_ids = [module.vpc.private_subnet_id, module.vpc.private_c_subnet_id]
  environment        = var.environment
  vpc_id             = module.vpc.vpc_id
  rds_sg_id          = module.security_group.rds_sg_id
}