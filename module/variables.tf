variable "project_name" {
  description = "name of resource"
}

variable "cluster_name" {
  description = "name of cluster"
}

variable "ec2_keypair" {
  description = "name of ec2 keypair"
}

variable "vpc_cidr" {
  description = "cidr of vpc, ex: 10.0.0.0/20"
}

variable "rtb_cidr" {
  description = "cidr of rtb, must not be belong to vpc_cidr, ex: 10.0.16.0/20"
}

variable "subnet_cidr" {
  description = "cidr of subnet, must be belong to vpc_cidr, ex: 10.0.0.0/24"
}

variable "subnet_az" {
  description = "az of subnet, ex: ap-northeast-1a"
}


