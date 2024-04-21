# Configure the AWS provider
provider "aws" {
  region = "ap-south-1" # Replace with your desired region
}

# Configure the Terraform backend to store the state file in the existing S3 bucket
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket-tharun" # Replace with your existing bucket name
    key    = "root"                      # State file will be stored at the root of the bucket
    region = "ap-south-1"                 # Replace with your desired region
  }
}
