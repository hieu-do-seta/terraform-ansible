
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
  filename        = abspath("${path.module}/../../../../keys/${var.key_name}.pem")
  file_permission = "0400"
}

