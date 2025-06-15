
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = "t4g.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.web_sg_id]

  associate_public_ip_address = true
  key_name               = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    set -e

    apt-get update -y
    apt-get install -y nginx

    # Cấu hình Nginx để reverse proxy đến frontend container (localhost:8080) và backend API
    cat > /etc/nginx/sites-available/default <<EONGINX
    server {
        listen 80;
        server_name _;

        location / {
            proxy_pass http://localhost:8080/;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }

        location /api/ {
            proxy_pass http://${aws_instance.api.private_ip}:3000/api/;
            proxy_http_version 1.1;
            proxy_set_header Host \$host;
            proxy_set_header X-Real-IP \$remote_addr;
            proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto \$scheme;
        }
    }
    EONGINX

    systemctl restart nginx
  EOF


  tags = {
    Name = "nginx-web"
  }
}


resource "aws_eip" "web_eip" {
  instance = aws_instance.web.id
}

resource "aws_instance" "api" {
  ami                    = var.ami_id
  instance_type          = "t4g.micro"
  subnet_id              = var.private_subnet_id
  vpc_security_group_ids = [var.api_sg_id]
  key_name               = var.key_name
  associate_public_ip_address = false
  user_data              = file("${path.module}/api_user_data.sh")
  tags = {
    Name = "${var.environment}-backend-api"
  }
}

resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = "t4g.micro"
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.web_sg_id]
  associate_public_ip_address = true
  key_name               = var.key_name
  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
  EOF
  tags = {
    Name = "${var.environment}-bastion-host"
  }
}
