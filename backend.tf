terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    key            = "dev/terraform.tfstate"
    bucket         = "terraform-state-bucket-usps-team-a"
    region         = "eu-west-2"
    dynamodb_table = "terraform-lock-table"
  }
}
