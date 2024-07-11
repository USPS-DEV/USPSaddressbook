module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.27"

  cluster_endpoint_public_access = true

  create_kms_key              = false
  create_cloudwatch_log_group = false
  cluster_encryption_config   = {}

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent = true
    }
  }

  vpc_id                   = var.vpc_id
  subnet_ids               = var.private_subnets
  control_plane_subnet_ids = var.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t3.medium"]
    iam_role_additional_policies = {
      AmazonEBSCSIDriverPolicy = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
    }
  }

  eks_managed_node_groups = {
    node-group-01 = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
    node-group-02 = {
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }

  # aws-auth configmap
  manage_aws_auth_configmap = true
  # create_aws_auth_configmap = true

  aws_auth_roles = [
    {
      rolearn  = var.rolearn
      username = "Lucky"
      groups   = ["system:Devops"]
    },
  ]

  tags = {
    env       = "dev"
    terraform = "true"
  }
}

#creating namespaces
resource "kubernetes_namespace" "dev" {
  metadata {
    annotations = {
      name = "dev"
    }

    labels = {
      app = "webapp"
    }

    name = "dev"
  }
}

#creating namespaces
resource "kubernetes_namespace" "uat" {
  metadata {
    annotations = {
      name = "uat"
    }

    labels = {
      app = "webapp"
    }

    name = "uat"
  }
}

resource "kubernetes_namespace" "production" {
  metadata {
    annotations = {
      name = "production"
    }

    labels = {
      app = "webapp"
    }

    name = "production"
  }
}

# resource "kubernetes_namespace" "monitoring" {
#   metadata {
#     annotations = {
#       name = "monitoring"
#     }

#     labels = {
#       app = "webapp"
#     }

#     name = "monitoring"
#   }
# }