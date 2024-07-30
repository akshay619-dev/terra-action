terraform {
  backend "s3" {
    encrypt = true    
    bucket = var.bucket_name
    dynamodb_table = var.dynamo_db_table
    key    = "terraform.tfstate"
    region = var.region
  }
}