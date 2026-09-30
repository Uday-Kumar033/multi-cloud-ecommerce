module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  name               = "${var.project_name}-eks"
  kubernetes_version = "1.33"

  endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    ecommerce_nodes = {
      name = "ecommerce-nodes"

      instance_types = [var.node_instance_type]

      min_size     = 1
      max_size     = 2
      desired_size = 1

      capacity_type = "ON_DEMAND"

      disk_size = 30

      labels = {
        role = "ecommerce"
      }

      tags = {
        Project = var.project_name
      }
    }
  }

  tags = {
    Project     = var.project_name
    Environment = "production"
    ManagedBy   = "Terraform"
  }
}
