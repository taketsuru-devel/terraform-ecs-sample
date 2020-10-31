

module "vpc" {
  source = "../module/vpc/module"

  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
  subnet_setting = var.subnet_setting
  public_ip_for_ec2 = true
}
