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

variable "subnet_setting" {
  description = "cidr and az on subnet"
  type = list(object({
    az_name = string
    cidr    = string
  })) 
}

variable "ec2_image_id" {
  description = "ref ssm: /aws/service/ecs/optimized-ami/amazon-linux/recommended/image_id"
}
