terraform {
  backend "s3" {
    bucket         = "my-bucket-tfstate1"
    key            = "envs/prod/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-tfstate-table"
    encrypt        = true
  }
}
