region      = "ap-northeast-1"

ami_id      = "ami-09b3bc58f5e2e4aa8"      # <== Thay bằng AMI ID cho production

key_name    = "prod-key"             # <== Key Name sẽ tạo: prod-key.pem

db_username = "prod_db_user"
db_password = "ProdDbStrongPassword123!"   # <== Lưu ý đặt pass mạnh!

environment = "prod"

github_repo = "hieu-do-seta/terraform-ansible"
ecr_repositories = ["backend", "frontend"]
