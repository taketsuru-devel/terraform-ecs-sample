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
