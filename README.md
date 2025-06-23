# Triển khai hạ tầng và cấu hình server bằng Terraform & Ansible

Dự án này giúp bạn triển khai hạ tầng EC2, RDS... bằng Terraform, sau đó cấu hình các máy chủ bằng Ansible một cách tự động.

---

## 🧱 Bước 1: Khởi tạo hạ tầng bằng Terraform

### ➤ Thực hiện


```bash
cd envs/prod

terraform apply -var-file="terraform.tfvars" -auto-approve && ./generate_inventory.sh
``` 
## 🧱 Bước 2: Khởi tạo môi trường

### ➤ Thực hiện
```bash
cd ../..   # trở về thư mục gốc nếu đang ở envs/prod

ansible-playbook \
  -i ansible/envs/prod/inventory.ini \
  -u ubuntu \
  ansible/bootstrap.yml
``` 