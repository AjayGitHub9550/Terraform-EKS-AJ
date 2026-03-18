resource "aws_eks_cluster" "eks" {
  name     = var.cluster_name
  role_arn = var.cluster_role

  vpc_config {
    subnet_ids = var.public_subnets
  }
}

resource "aws_eks_node_group" "node" {
  depends_on = [aws_eks_cluster.eks]
  cluster_name    = aws_eks_cluster.eks.name
  node_group_name = "worker-nodes"
  node_role_arn   = var.node_role
  subnet_ids      = var.public_subnets

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  instance_types = ["t3.medium"]
  ami_type = "AL2_x86_64"
}