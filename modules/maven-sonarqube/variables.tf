variable "region" {
  description = "The AWS region to deploy to"
  default     = "eu-west-2"
}

# variable "ami_id" {
#   description = "The AMI ID for the EC2 instance"
#   type        = string
# #   default     = data.aws_ami.redhat.id
# }

variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default     = "t2.medium"
}

variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
  default = "jenkins_key"
}

# variable "security_group_id" {
#   description = "The security group ID to attach to the instance"
#   type        = string
#   default = "value"
# }

# variable "subnet_id" {
#   description = "The subnet ID where the instance will be deployed"
#   type        = string
#   default = "value"
# }

variable "db_name" {
  description = "The name of the PostgreSQL database"
  type        = string
  default = "devdb"
}

variable "db_username" {
  description = "The username for the PostgreSQL database"
  type        = string
  default = "devdb"
}

variable "db_password" {
  description = "The password for the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "db_security_group_id" {
  description = "The security group ID for the PostgreSQL database"
  type        = string
}

variable "db_subnet_group" {
  description = "The subnet group for the PostgreSQL database"
  type        = string
}