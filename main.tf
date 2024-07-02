provider "aws" {
  region = var.region
}
##############################################
# Jenkins Server Module
##############################################
module "jenkins" {
  source                      = "./modules/jenkins"
  # ami                         = var.ami
  instance_type               = var.instance_type
  instance_tags               = var.instance_tags
  associate_public_ip_address = var.associate_public_ip_address
}


##############################################
# Terraform Module
##############################################
module "terraform" {
  source                      = "./modules/terraform"
  instance_type               = var.instance_type
  # ami                         = var.ami
  associate_public_ip_address = var.associate_public_ip_address
}