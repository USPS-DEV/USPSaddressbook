# variable "ami" {
#   type        = string
#   description = "AMI ID"
# }

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "jenkins_key_name"
}

variable "instance_tags" {
  type        = string
  description = "EC2 instance tags"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "associate ip address value"
}