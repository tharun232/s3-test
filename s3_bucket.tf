resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  force_destroy = true

  tags = {
    Name = "My Terraform Managed Bucket"
    Name = "Test"
    Name = "Test1"
    Env  = "Cloud"

  }
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.example.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.example]

  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

