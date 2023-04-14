# Strapi Automation Project
This project automates the deployment process of a Strapi app on AWS EC2 using Terraform, Python, and Bash scripting. Follow the instructions below to use this project on your machine.

## Prerequisites:
Make sure that the following software is installed on your development machine:
- Python 3
- Git
- Terraform

  Also, you should have a Strapi project on your development machine and the same hosted on GitHub.

## Instructions:
1. Clone the Terraform code using the following command:
```bash
git clone https://github.com/VinayakSingoriya/Strapi-Automation.git
```
2. Create an SSH key pair using the following command:
```bash
ssh-keygen
```
This will create a public and private key pair.

3. Jump into the root directory of the Terraform code and create a file named terraform.tfvars and add the following content to the file:
```
# Region and Access Crendentials
region     = "us-east-1"
access_key = ""
secret_key = ""

# Instance Info
instance_type = "t2.small"
image_name    = "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"

# Key-Pair Info (set the private and public key path which is gererated in step 2)
key_name         = ""
private_key_path = ""
public_key_path  = ""

# EC2 Security Group Info
instance_security_group_name = ""
inbound_ports                = [80, 443, 22, 1337]

# RDS Security Group Info
db_security_group_name = ""

# RDS config
db_username = ""
db_password = ""

#path
project_root_path   = ""  # set the root path of the Strapi project (which is on development machine)
terraform_root_path = ""  # set the root path of the Terraform code (which is on development machine)

#Git Credentials
# git clone https://$GIT_USERNAME:$GIT_PASSWORD@github.com/your_username/your_repo.git
gitUsername   = ""            # GIT_USERNAME
gitPassword   = ""            # GIT_PASSWORD
your_username = ""
your_repo     = ""

```

Replace the values of the keys in the file according to your requirements.

4. Run the init command in the root folder of the Terraform code. This will download and install the required provider plugins specified in the configuration files:

```bash
terraform init
```

5. Run the following command to deploy the application automatically:

```bash
terraform apply --auto-approve
```
This will deploy your Strapi app on AWS EC2 within 5 minutes. Don't let deployment hurdles hold you back! Contact the project creator if you encounter any roadblocks while deploying your Strapi app on AWS EC2. I'm here to help you succeed!
