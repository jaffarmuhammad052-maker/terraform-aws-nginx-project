module "vpc" {
  source          = "./modules/vpc"
  project         = var.project
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  azs             = var.azs
}

module "security" {
  source  = "./modules/security_groups"
  project = var.project
  vpc_id  = module.vpc.vpc_id
  my_ip   = var.my_ip
}

module "alb" {
  source            = "./modules/alb"
  project           = var.project
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
}

module "asg" {
  source            = "./modules/ec2_asg"
  project           = var.project
  public_subnet_ids = module.vpc.public_subnet_ids
  ec2_sg_id         = module.security.ec2_sg_id
  target_group_arn  = module.alb.target_group_arn
}
