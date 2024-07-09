# AWS provider configuration
provider "aws" {
  region = var.region

}

# Data source for the EKS cluster
data "aws_eks_cluster" "eks_cluster" {
  name = module.eks.cluster_name
}

# Data source for the EKS cluster authentication
data "aws_eks_cluster_auth" "eks_cluster_auth" {
  name = module.eks.cluster_name
}

# Kubernetes provider configuration
provider "kubernetes" {
  host                   = data.aws_eks_cluster.eks_cluster.endpoint
  token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
}

# Helm provider configuration
provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.eks_cluster.endpoint
    token                  = data.aws_eks_cluster_auth.eks_cluster_auth.token
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  }
}