module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.3"

  cluster_name    = local.name
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  control_plane_subnet_ids = module.vpc.intra_subnets

  cluster_addons = {
    vpc-cni = { most_recent = true }
    kube-proxy = { most_recent = true }
    coredns = { most_recent = true }
  }

  eks_managed_node_groups = {

    satyam_node_group = {

      instance_types = ["t3.medium"]

      desired_size = 2
      min_size     = 1
      max_size     = 3

      capacity_type = "SPOT"

      attach_cluster_primary_security_group = true
    }
  }

  tags = {
    Environment = local.env
    Terraform   = "true"
  }
}