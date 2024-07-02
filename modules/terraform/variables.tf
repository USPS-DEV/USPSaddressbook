# variable "ami" {
#   type = string
#   description = "UBUNTU AMI"
# }

variable "key_name" {
  type        = string
  description = "terraform_key_name"
}

variable "instance_type" {
  type        = string
  description = "UBUNTU INSTANCE TYPE"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "ASSOCIATED PUBLIC IP"
}