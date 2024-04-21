# Configure the AWS provider
provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}

# Create an S3 bucket to store the Terraform state file
resource "aws_s3_bucket" "terraform_state_bucket" {
  bucket = "my-terraform-state-bucket" # Replace with your desired bucket name

  # Prevent accidental deletion of the state bucket
  lifecycle {
    prevent_destroy = true
  }

  # Enable versioning for the state file
  versioning {
    enabled = true
  }

  # Enable server-side encryption for the state file
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Configure the Terraform backend to store the state file in the S3 bucket
terraform {
  backend "s3" {
    bucket         = aws_s3_bucket.terraform_state_bucket.bucket
    key            = "root" # Replace with your desired path
    region         = "ap-south-1"             # Replace with your desired region
  }
}
