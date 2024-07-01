variable "ami" {
  type = string
  description = "UBUNTU EC2 AMI"
}

variable "instance_type" {
  type = string
  description = "UBUNTU INSTANCE TYPE"
}

variable "associate_public_ip_address" {
  type = bool
  description = "ASSOCIATED PUBLIC IP"
}