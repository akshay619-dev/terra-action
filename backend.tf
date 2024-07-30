terraform {
  backend "s3" {
    encrypt = true    
    bucket = "terraform-pro-s3"
    dynamodb_table = "terra_action_dylock"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}