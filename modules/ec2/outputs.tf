output "web_eip" {
  value = aws_eip.web_eip.public_ip
}

output "api_private_ip" {
  value = aws_instance.api.private_ip
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}
