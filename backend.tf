terraform {
  backend "s3" {
    bucket = "terraform-s3-2026"
    region = "ap-south-1"
    key = "terraform/terraform.tfstate"
    dynamodb_table = "terraform_lock_2024"
  }
}
