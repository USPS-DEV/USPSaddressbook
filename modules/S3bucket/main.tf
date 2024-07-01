provider "aws" {
  version = "~> 3.0"
  region  = "eu-west-2"
}
terraform {
  backend "s3" {
    bucket = "USPS_Dev"
    key    = "Usps_key"
    region = "eu-west-2"
  }
}
resource "aws_s3_bucket" "s3Bucket" {
  bucket = "[USPS-Dev]"
  acl    = "public-read"

  policy = <<EOF
{
  "Id": "MakePublic",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::[USPS-Dev]/*",
      "Principal": "*"
    }
  ]
}

