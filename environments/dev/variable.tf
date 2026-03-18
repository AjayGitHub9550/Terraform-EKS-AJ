variable "region" {
  description = "The AWS region"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "The list of public subnets"
  type        = list(string)
}

variable "private_subnets" {
  description = "The list of private subnets"
  type        = list(string)
}

variable "azs" {
  description = "The list of availability zones"
  type        = list(string)
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_role" {
  description = "The IAM role for the EKS cluster"
  type        = string
}

variable "node_role" {
  description = "The IAM role for the EKS nodes"
  type        = string
}