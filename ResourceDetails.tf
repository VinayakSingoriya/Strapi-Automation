output "instance_details" {
  value = {
    instance_id = aws_instance.strapi.id
    public_ip   = aws_instance.strapi.public_ip
    private_ip  = aws_instance.strapi.private_ip
  }

  #   filename = "instance_details.json"
}