module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "projetCloud-cluster"
  cluster_version = "1.30"
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # Hadi khlliha True bach t-dkhel admin automatique
  enable_cluster_creator_admin_permissions = true

  # MAT-ZIDCH block "access_entries" hna bach ma-i-t-3awedch l-Conflict

  eks_managed_node_groups = {
    spot_nodes = {
      instance_types = ["t3.micro"] # Free Tier
      capacity_type  = "SPOT"
      min_size = 1
      max_size = 2
      desired_size = 1
    }
  }
}
