module "network" {
  source = "./modules/network/"
  elastic_ip_id = module.load_balancer.elastic_ip_id
}
module "load_balancer" {
  source = "./modules/loadbalancer/"

  security_group_id  = module.instances.security_group_id
  vpc_id             = module.network.vpc_id
  public_subnet_id   = module.network.public_subnet_id
  public_subnet_id_2 = module.network.public_subnet_id_2
  instance_id        = module.instances.instance_id
}
# module "ACM" {
#   source = "./modules/acm/"
#   route53_id = module.route53.route53_id
# }
module "route53" {
  source       = "./modules/route-53/"
  alb_dns_name = module.load_balancer.alb_dns_name
}
module "instances" {
  depends_on = [module.network]
  source     = "./modules/instances/"

  public_subnet_id = module.network.public_subnet_id
  vpc_id           = module.network.vpc_id
  vpc_cidr_block   = module.network.vpc_cidr_block

}
module "ecr" {
  source = "./modules/ecr/"
}