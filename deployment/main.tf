terraform {
  backend "s3" {
    bucket = "terraform-tfstate-s3"
    region = "ap-northeast-1"
    key = "ecs-sample"
  }
}

provider "aws" {
  region = "ap-northeast-1"
  profile = "default"
}

module "module_ecs" {
  source = "../module/"
  
  project_name = "ecs-sample"
  cluster_name = "ecs-test-cluster"
  ec2_keypair = "ec2nano"

  vpc_cidr = "10.3.0.0/16"
  rtb_cidr = "0.0.0.0/0"
  subnet_cidr = "10.3.3.0/24"
  subnet_az = "ap-northeast-1a"
}

