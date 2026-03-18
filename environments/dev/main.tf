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