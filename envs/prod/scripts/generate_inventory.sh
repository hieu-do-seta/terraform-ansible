#!/bin/bash

# Đảm bảo thư mục ansible tồn tại
mkdir -p ansible

# Tạo file inventory.ini dùng key path mặc định từ ansible.cfg
cat <<EOF > ansible/inventory.ini
[web]
$(terraform output -raw prod_web_public_ip) ansible_user=ubuntu

[api]
$(terraform output -raw prod_api_private_ip) ansible_user=ubuntu

[bastion]
$(terraform output -raw prod_bastion_public_ip) ansible_user=ubuntu
EOF

echo "[INFO] ✅ Inventory generated at ansible/inventory.ini"
