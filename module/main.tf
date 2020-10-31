

module "vpc" {
  source = "../module/vpc/module"

  project_name = var.project_name
  vpc_cidr = var.vpc_cidr
  rtb_cidr = var.rtb_cidr
  subnet_cidr = var.subnet_cidr
  subnet_az = var.subnet_az
  public_ip_for_ec2 = true
}
