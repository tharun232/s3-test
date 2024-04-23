resource "aws_s3_bucket" "var.resource" {
  bucket = var.bucket_name

  force_destroy = true

  tags = {
    Name = "My Terraform Managed Bucket"
  }
}

resource "aws_s3_bucket_ownership_controls" "var.resource" {
  bucket = aws_s3_bucket.var.resource.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "var.resource" {
  depends_on = [aws_s3_bucket_ownership_controls.var.resource]

  bucket = aws_s3_bucket.var.resource.id
  acl    = "private"
}

