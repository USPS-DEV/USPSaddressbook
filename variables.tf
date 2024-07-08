###############################################
# Global region
###############################################
variable "region" {
  type        = string
  description = "region of our resource"
  default     = "eu-west-2"
}

###############################################
# Jenkin Server Variables
###############################################
# variable "ami" {
#   type        = string
#   description = "AM ID"
#   default     = data.aws_ami.ubuntu.id

# }

variable "cluster_name" {
  type    = string
  default = "usps-cluster"
}

variable "env_name" {
  type    = string
  default = "dev"
}

variable "rolearn" {
  type = string
  description = "IAM rolearn"
  default = "arn:aws:iam::339712828145:role/eks_full_access"
}


variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "instance_tags" {
  type        = string
  description = "EC2 instance tags"
  default     = "Jenkins_server"
}

variable "key_name" {
  type        = string
  description = "usps_severs_key_name"
  default     = "jenkins_key"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "associate ip address value"
  default     = true
}


#########################
#s3_bucket and dynamodb_table
#########################

variable "s3_bucket" {
  description = "The name of the S3 bucket for storing Terraform state"
  type        = string
  default     = "terraform-state-bucket-usps-team-a"
}

variable "dynamodb_table" {
  description = "The name of the DynamoDB table for state locking"
  type        = string
  default     = "terraform-lock-table"
}