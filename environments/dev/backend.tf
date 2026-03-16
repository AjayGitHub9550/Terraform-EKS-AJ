terraform {

 backend "s3" {

   bucket = "terraform-eks-state-yerukula"
   key    = "dev/terraform.tfstate"
   region = "eu-north-1"

   use_lockfile = true
 }
}