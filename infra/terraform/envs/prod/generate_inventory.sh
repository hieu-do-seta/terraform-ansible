#!/bin/bash

APP_IP=$(terraform output -raw prod_api_private_ip)
FRONTEND_IP=$(terraform output -raw prod_web_public_ip)
BASTION_IP=$(terraform output -raw prod_bastion_public_ip)

TARGET_PATH="../../../ansible/envs/prod/inventory.ini"
mkdir -p "$(dirname "$TARGET_PATH")"

cat <<EOF > "$TARGET_PATH"
[app]
$APP_IP  # private IP của EC2

[frontend]
$FRONTEND_IP  # public IP của EC2 frontend

[app:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=keys/prod-key.pem
ansible_ssh_common_args='-o ProxyCommand="ssh -i keys/prod-key.pem -W %h:%p ubuntu@$BASTION_IP" -o StrictHostKeyChecking=no'

[frontend:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=keys/prod-key.pem
ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOF

echo "✔️ inventory.ini đã được tạo tại $TARGET_PATH"
