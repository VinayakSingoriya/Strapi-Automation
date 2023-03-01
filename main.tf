terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA2WXHFVL4V66VYRAY"
  secret_key = "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"
}

# resource "null_resource" "strapi_local" {
#   provisioner "local-exec" {
#     command = "./scripts/localDatabase.sh"
#   }
# }

resource "aws_instance" "strapi" {
  ami           = "ami-0557a15b87f6559cf"
  instance_type = "t2.micro"
  security_groups = [ aws_security_group.strapi_sg.name ]
  key_name = "strapi_automation"

  tags = {
    Name = "Strapi_app"
  }

connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/vinayak/Desktop/strapi_automation/terraform_dir/strapi_automation.pem")
      timeout     = "4m"
   }

  provisioner "file" {
    source      = "./scripts/nodeSetup.sh"
    destination = "/home/ubuntu/nodeSetup.sh"
  }

  provisioner "file" {
    source      = "./scripts/nginxSetup.sh"
    destination = "/home/ubuntu/nginxSetup.sh"
  }

  provisioner "file" {
    source      = "./scripts/pullCode.sh"
    destination = "/home/ubuntu/pullCode.sh"
  }

  provisioner "file" {
    source      = "/home/vinayak/Desktop/strapiApp/.env"
    destination = "/home/ubuntu/.env"
  }


  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ubuntu/nginxSetup.sh",
      "/home/ubuntu/nginxSetup.sh",
      "sudo chmod +x /home/ubuntu/nodeSetup.sh",
      "/home/ubuntu/nodeSetup.sh",
      "sudo chmod +x /home/ubuntu/pullCode.sh",
      "/home/ubuntu/pullCode.sh",
      "mv /home/ubuntu/.env /home/ubuntu/strapiApp/",
      "sudo rm -f .env",
      "cd /home/ubuntu/strapiApp/ && npm i && npm run develop"
    ]
  }
}




resource "aws_security_group" "strapi_sg" {
  name        = "strapi_sg"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 1337
    to_port          = 1337
    protocol         = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Port 22 ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags = {
    Name = "strapi_sg"
  }
}
