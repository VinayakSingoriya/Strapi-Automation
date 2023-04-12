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
      "npm install",
      "pm2 start 'npm start'",
    ]
  }


}


resource "null_resource" "delete_output" {

  provisioner "local-exec" {
    when    = destroy
    command = "{} > instance-details.json && {} > rds-details.json && {} > s3-details.json"
  }

}