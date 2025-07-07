output "web_eip" {
  value = aws_eip.web_eip.public_ip
}

output "api_private_ip" {
  value = aws_instance.api.private_ip
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "frontend_instance_id" {
  value = aws_instance.web.id
}

output "backend_instance_id" {
  value = aws_instance.api.id
}

output "bastion_instance_id" {
  value = aws_instance.bastion.id
}

