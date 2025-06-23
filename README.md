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

## 🚀 Bước 3: CI/CD tự động build và deploy


## 🔐 Thiết lập Secrets

Vào **Repository > Settings > Secrets and variables > Actions**, thêm các secret sau:

| Tên Secret      | Mô tả                                       |
|------------------|----------------------------------------------|
| `PROD_KEY`       | Nội dung file `prod-key.pem` (SSH private key) |
| `BASTION_IP`     | Public IP của bastion host                  |
| `SERVER_IP`      | Private IP của EC2 backend                  |
| `FRONTEND_IP`    | Public IP của EC2 frontend                  |

> 💡 Mẹo: để copy SSH key nhanh:
> ```bash
> cat keys/prod-key.pem | pbcopy  # macOS
> ```

Khi bạn push code lên nhánh `main`, hệ thống CI/CD sẽ tự động(hoặc rerun actions)