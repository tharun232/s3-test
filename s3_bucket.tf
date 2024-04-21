resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  force_destroy = true

  tags = {
    Name = "My Terraform Managed Bucket"
  }
}
