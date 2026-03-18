# Variables for AWS provider
region = "eu-north-1"

# Variables for VPC module
vpc_name = "eks-vpc"
vpc_cidr = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
azs = ["eu-north-1a", "eu-north-1b"]

# Variables for EKS module
cluster_name = "dev-eks"
cluster_role = "arn:aws:iam::870923192415:role/eks-cluster-role"
node_role = "arn:aws:iam::870923192415:role/eks-node-policy"