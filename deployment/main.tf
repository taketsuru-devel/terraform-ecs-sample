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
  subnet_setting = [{
    az_name = "ap-northeast-1a"
    cidr = "10.3.1.0/24"
  }, {
    az_name = "ap-northeast-1c"
    cidr = "10.3.2.0/24"
  }]
}

