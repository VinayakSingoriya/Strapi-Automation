resource "aws_s3_bucket" "strapi_s3" {
  bucket = "strapi-bucket-3636"

  tags = {
    Name = "Strapi"
  }

  provisioner "local-exec" {
    command = "terraform output -json >> infrastructure.json"
  }
}

resource "aws_s3_bucket_public_access_block" "strapi_s3" {
  bucket = aws_s3_bucket.strapi_s3.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = true
}