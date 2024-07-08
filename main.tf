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


##############################################
# vpc module
##############################################
module "vpc" {
  source = "./modules/vpc"
  region = var.region
}


##############################################
# eks cluster
##############################################
module "eks" {
  source                   = "./modules/eks-cluster"
  rolearn                  = var.rolearn
  vpc_id                   = module.vpc.vpc_id
  private_subnets          = module.vpc.private_subnets
}

module "aws_alb_controller" {
  source = "./modules/alb-controller"

  region  = var.region
  env_name     = var.env_name
  cluster_name = var.cluster_name

  vpc_id            = module.vpc.vpc_id
  oidc_provider_arn = module.eks.oidc_provider_arn
}