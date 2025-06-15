# modules/security_group/outputs.tf

output "web_sg_id" {
  value = aws_security_group.web_sg.id
}

output "api_sg_id" {
  value = aws_security_group.api_sg.id
}

output "rds_sg_id" {
  value = aws_security_group.rds_sg.id
}
