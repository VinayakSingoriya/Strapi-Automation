resource "null_resource" "save_output" {

  depends_on = [
    aws_db_instance.strapi,
    aws_instance.strapi,
    aws_s3_bucket.strapi_s3,
  ]

  connection {
    type        = "ssh"
    host        = aws_instance.strapi.public_ip
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    timeout     = "4m"
  }

  provisioner "file" {
    source      = "./instance-details.json"
    destination = "/home/ubuntu/instance-details.json"
  }

  provisioner "file" {
    source      = "./rds-details.json"
    destination = "/home/ubuntu/rds-details.json"
  }

  provisioner "file" {
    source      = "./s3-details.json"
    destination = "/home/ubuntu/s3-details.json"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt install python3-pip -y",
      "pip3 install python-dotenv",
      "python3 /home/ubuntu/configENV.py",
      "cd /home/ubuntu/strapiApp/",
      "export PATH=$PATH:/home/ubuntu/.nvm/versions/node/v16.20.0/bin",
      "node -v && pm2 -v",
      "/home/ubuntu/.nvm/versions/node/v16.20.0/bin/npm install",
      "/home/ubuntu/.nvm/versions/node/v16.20.0/bin/pm2 start '/home/ubuntu/.nvm/versions/node/v16.20.0/bin/npm start'",
    ]
  }


}


resource "null_resource" "delete_output" {

  provisioner "local-exec" {
    when    = destroy
    command = "echo {} > instance-details.json && echo {} > rds-details.json && echo {} > s3-details.json"
  }

}