# Region and Access Crendentials
region     = "us-east-1"
access_key = "AKIA2WXHFVL4V66VYRAY"
secret_key = "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"

# Instance Info
ami_id        = "ami-0557a15b87f6559cf"
instance_type = "t2.micro"

# Key-Pair Info
key_name         = "strapi_automation"
private_key_path = "/home/vinayak/Desktop/strapi_automation/terraform_dir/id_rsa"
public_key_path  = "/home/vinayak/Desktop/strapi_automation/terraform_dir/id_rsa.pub"

# Security Group Info
security_group_name = "strapi_sg"
inbound_ports       = [80, 443, 22, 1337]