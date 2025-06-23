#!/bin/bash

# === Lấy IP từ Terraform output (môi trường dev) ===
APP_IP=$(terraform output -raw dev_api_private_ip)
FRONTEND_IP=$(terraform output -raw dev_web_public_ip)
BASTION_IP=$(terraform output -raw dev_bastion_public_ip)

# === Đường dẫn tới inventory.ini cần tạo ===
TARGET_PATH="../../ansible/envs/dev/inventory.ini"
mkdir -p "$(dirname "$TARGET_PATH")"

# === Ghi nội dung vào inventory.ini ===
cat <<EOF > "$TARGET_PATH"
[app]
$APP_IP              # private IP của EC2 backend

[frontend]
$FRONTEND_IP         # public IP của EC2 frontend

[app:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=keys/key-dev.pem
ansible_ssh_common_args='-o ProxyCommand="ssh -i keys/key-dev.pem -W %h:%p ubuntu@$BASTION_IP" -o StrictHostKeyChecking=no'

[frontend:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=keys/key-dev.pem
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF

echo "✅ Đã tạo inventory.ini cho môi trường dev tại $TARGET_PATH"
