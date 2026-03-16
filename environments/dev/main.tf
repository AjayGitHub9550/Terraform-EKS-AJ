provider "aws" {
  region = "eu-north-1"
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name = "eks-vpc"
  vpc_cidr = "10.0.0.0/16"

  public_subnets  = ["10.0.1.0/24","10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24","10.0.4.0/24"]

  azs = ["eu-north-1a","eu-north-1b"]
}

module "eks" {
  source = "../../modules/eks"

  cluster_name   = "dev-eks"
  private_subnets = module.vpc.private_subnets

  cluster_role = "arn:aws:iam::123456:role/EKSClusterRole"
  node_role    = "arn:aws:iam::123456:role/EKSNodeRole"
}