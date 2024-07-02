provider "aws" {
  region = var.region
}
##############################################
# Jenkins Server Module
##############################################
module "jenkins" {
  source = "./modules/jenkins"
  # ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  instance_tags               = var.instance_tags
  associate_public_ip_address = var.associate_public_ip_address
}


##############################################
# Terraform Module
##############################################
module "terraform" {
  source        = "./modules/terraform"
  key_name      = var.key_name
  instance_type = var.instance_type
  # ami                         = data.aws_ami
  associate_public_ip_address = var.associate_public_ip_address
}



##############################################
# s3 bucket
##############################################
module "s3" {
  source = "./modules/S3bucket"
  bucket = var.s3_bucket
  table  = var.dynamodb_table
}