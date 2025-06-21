resource "tls_private_key" "ssh_key_prod" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key_prod" {
  key_name   = var.key_name   # Ex: prod-key
  public_key = tls_private_key.ssh_key_prod.public_key_openssh
}

resource "local_file" "private_key_pem_prod" {
  content         = tls_private_key.ssh_key_prod.private_key_pem
  filename        = abspath("${path.module}/../../keys/${var.key_name}.pem")
  file_permission = "0400"
}
