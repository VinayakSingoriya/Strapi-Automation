# Region and Access Crendentials
region     = "us-east-1"
access_key = "AKIA2WXHFVL4V66VYRAY"
secret_key = "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"

# Instance Info
instance_type = "t2.micro"
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