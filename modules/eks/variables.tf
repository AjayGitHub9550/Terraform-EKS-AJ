variable "cluster_name" {}

variable "cluster_role" {}

variable "node_role" {}

variable "private_subnets" {
  type = list(string)
}