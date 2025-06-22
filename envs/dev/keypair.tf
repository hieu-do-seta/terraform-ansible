provider "aws" {
  region = var.region
}

resource "tls_private_key" "ssh_key_dev" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key_dev" {
  key_name   = var.key_name
  public_key = tls_private_key.ssh_key_dev.public_key_openssh
}

resource "local_file" "private_key_pem_dev" {
  content         = tls_private_key.ssh_key_dev.private_key_pem
  filename        = abspath("${path.module}/../../keys/${var.key_name}.pem")
  file_permission = "0400"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "cheap_ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.generated_key_dev.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = "cheap-ec2"
  }
}
