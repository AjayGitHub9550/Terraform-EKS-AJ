variable "cluster_name" {}

variable "cluster_role" {}

variable "node_role" {}

variable "public_subnets" {
  type = list(string)
}