variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "The AWS region where the bucket is created"
  type        = string
  default     = ""
}
