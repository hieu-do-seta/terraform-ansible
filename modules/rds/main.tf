# resource "aws_db_instance" "postgres" {
#   allocated_storage      = 20
#   engine                 = "postgres"
#   engine_version         = "16.9"
#   instance_class         = "db.t3.micro"
#   username               = var.db_username
#   password               = var.db_password
#   db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
#   vpc_security_group_ids = [var.rds_sg_id]
#   skip_final_snapshot    = true
#   publicly_accessible    = false
#   # add subnet group etc
# }

# resource "aws_db_subnet_group" "rds_subnet_group" {
#   name       = "${var.environment}-rds-subnet-group"
#   subnet_ids = var.private_subnet_ids
# }
