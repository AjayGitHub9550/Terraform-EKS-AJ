provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  azs = var.azs
}

module "eks" {
  source = "../../modules/eks"

  cluster_name   = var.cluster_name
  private_subnets = module.vpc.private_subnets

  cluster_role = var.cluster_role
  node_role    = var.node_role
}

module "nat" {
  source = "../../modules/nat"

  vpc_id             = module.vpc.vpc_id
  public_subnet_id   = module.vpc.public_subnets[0]   # NAT in public subnet
  private_subnet_ids = module.vpc.private_subnets
}