# Region and Access Crendentials
region     = "us-east-1"
access_key = "AKIA2WXHFVL4SBNHECOJ"
secret_key = "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"

# Instance Info
instance_type = "t2.small"
image_name    = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

# Key-Pair Info
key_name         = "strapi_automation"
private_key_path = "/home/vinayak/.ssh/strapi_rsa"
public_key_path  = "/home/vinayak/.ssh/strapi_rsa.pub"

# EC2 Security Group Info
instance_security_group_name = "strapi_sg"
inbound_ports                = [80, 443, 22, 1337]

# RDS Security Group Info
db_security_group_name = "strapi_db"

# RDS config
db_username = "strapi"
db_password = "password"

#path
project_root_path   = "/home/vinayak/Desktop/Test/my-project"
terraform_root_path = "/home/vinayak/Desktop/strapi_automation/terraform_dir"

#Git Credentials
# git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/your_username/your_repo.git

gitUsername   = "VinayakSingoriya"                         #GIT_USERNAME
gitPassword   = "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" #GIT_PASSWORD
your_username = "VinayakSingoriya"
your_repo     = "test"