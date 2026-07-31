locals {
  name_prefix = "${var.auto_healing_web_tier}-${var.environment}"
}


module "network" {
  source = "./modules/network"

  name_prefix         = local.name_prefix
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
}

module "security" {
  source = "./modules/security"

  name_prefix       = local.name_prefix
  vpc_id            = module.network.vpc_id
  allowed_http_cidr = var.allowed_http_cidr
}

module "compute" {
  source = "./modules/compute"

  name_prefix       = local.name_prefix
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  alb_sg_id         = module.security.alb_sg_id
  instance_sg_id    = module.security.instance_sg_id
  instance_type     = var.instance_type
  min_size          = var.min_size
  max_size          = var.max_size
  desired_capacity  = var.desired_capacity
  enable_container  = var.enable_container
  container_image   = var.container_image
}
