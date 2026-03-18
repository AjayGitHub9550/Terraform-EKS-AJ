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

  vpc_id             = aws_vpc.main.id
  public_subnet_id   = var.public_subnets   # NAT in public subnet
  private_subnet_ids = var.private_subnets
}