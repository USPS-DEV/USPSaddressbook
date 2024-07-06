################################################################################
# General Variables from root module
################################################################################
variable "cluster_name" {
  type    = string
  default = "usps-cluster"
}

variable "vpc_id" {
  type        = string
  description = "vpc id value"

}

variable "private_subnets" {
  type        = list(any)
  description = "subnet id value"
}

variable "rolearn" {
  type        = string
  description = "rolearn id value"
  default = "arn:aws:iam::339712828145:role/eks_full_access"
}




