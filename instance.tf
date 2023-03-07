resource "aws_instance" "strapi" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  security_groups = [aws_security_group.strapi_sg.name]
  key_name        = aws_key_pair.deployer.key_name

  tags = {
    Name = "Strapi_app"
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file(var.private_key_path)
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
