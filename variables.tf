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

variable "associate_public_ip_address" {
  type        = bool
  description = "associate ip address value"
  default     = true
}