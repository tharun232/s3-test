variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "aws_region" {
  description = "The AWS region where the bucket is created"
  type        = string
  default     = "us-west-2"
}
