data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "strapi" {
  ami             = data.aws_ami.ubuntu.id
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
    source      = "./config/ecosystem.config.js"
    destination = "/home/ubuntu/ecosystem.config.js"
  }


  provisioner "file" {
    source      = "/home/vinayak/Desktop/strapiApp/.env"
    destination = "/home/ubuntu/.env"
  }

  provisioner "file" {
    source      = "./scripts/configENV.py"
    destination = "/home/ubuntu/configENV.py"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ubuntu/nginxSetup.sh",
      "/home/ubuntu/nginxSetup.sh",
      "sudo chmod +x /home/ubuntu/nodeSetup.sh",
      "/home/ubuntu/nodeSetup.sh",
    ]
  }

  provisioner "local-exec" {
    command = "scripts/localConfig.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ubuntu/pullCode.sh",
      "/home/ubuntu/pullCode.sh",
      "mv /home/ubuntu/.env /home/ubuntu/strapiApp/.env",
      "sudo rm -f .env",
    ]
  }

  provisioner "local-exec" {
    command = <<EOF
      echo '{
        "instance_id": "${aws_instance.strapi.id}",
        "public_ip": "${aws_instance.strapi.public_ip}"
      }' > instance-details.json
    EOF
  }

}
