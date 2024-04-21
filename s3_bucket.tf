resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  force_destroy = true

  tags = {
    Name = "My Terraform Managed Bucket"
  }
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  bucket = aws_s3_bucket.my_bucket.bucket
  
  acl    = "private"  # Set the ACL to "private" or any other desired ACL
}

