terraform {
  backend "s3" {
    bucket  = "terraform-bkt-st"
    key     = "terraform/infrastructuress/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    dynamodb_table = "testdb"
  }
}
