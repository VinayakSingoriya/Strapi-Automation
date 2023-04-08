resource "null_resource" "save_output" {
  provisioner "local-exec" {
    command = "terraform output -json > output.json"
  }
  connection {
    type        = "ssh"
    host        = aws_instance.strapi.public_ip
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    timeout     = "4m"
  }

  provisioner "file" {
    source      = "./output.json"
    destination = "/home/ubuntu/output.json"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install python3-pip -y",
      "pip3 install python-dotenv",
      "python3 /home/ubuntu/configENV.py",
      "cd /home/ubuntu/strapiApp/",
      "sudo npm install pm2@latest -g",

    ]
  }

  depends_on = [
    aws_instance.strapi,
    aws_db_instance.strapi,
    aws_s3_bucket.strapi_s3,
  ]
}

resource "null_resource" "delete_output" {

  provisioner "local-exec" {
    when    = destroy
    command = "> output.json"
  }

}