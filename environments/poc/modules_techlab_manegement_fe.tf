//** Secret Management Module **//
module "techlab_management_fe_secret_manager" {
  source = "../../modules/secret_manager/techlab_management_fe"

  // Variables for the module
  environment_name = var.environment_name
}

//** ECR Module **//
module "techlab_management_fe_ecr" {
  source = "../../modules/ecr/techlab_management_fe"

  // Variables for the module
  environment_name = var.environment_name
}

//** ECS Module **//
module "techlab_management_fe_ecs" {
  source = "../../modules/ecs/techlab_management_fe"

  // Variables for the module
  environment_name                = var.environment_name
  ecr_uri                         = module.techlab_management_fe_ecr.ecr_uri
  logs_region                     = var.region
  public_subnet_id                = module.network.pub_subnet_id_1a
  security_group_ecs_task_service = module.network.techlab_management_fe_security_group_ecs_task_service
  ecs_task_execution_role_arn     = module.techlab_management_fe_iam.techsup_task_execution_role_arn
  ecs_task_container_role_arn     = module.techlab_management_fe_iam.techsup_task_container_role_arn
  secret_arn                      = module.techlab_management_fe_secret_manager.secret_arn
}

//** IAM Module **//
module "techlab_management_fe_iam" {
  source = "../../modules/iam/techlab_management_fe"

  // Variables for the module
  environment_name = var.environment_name
  secert_arn       = module.techlab_management_fe_secret_manager.secret_arn
  ecr_arn          = module.techlab_management_fe_ecr.ecr_arn
}


//** Load Balancer Module **//
module "techlab_management_fe_load_balancer" {
  source = "../../modules/load_balancer/techlab_management_fe"

  // Variables for the module
  environment_name                    = var.environment_name
  aws_security_group_load_balancer_id = module.network.techlab_management_fe_sercurity_group_allow_https_id
  subnet_1a_load_balancer_id          = module.network.pub_subnet_id_1a
  subnet_1c_load_balancer_id          = module.network.pub_subnet_id_1c
  vpc_id                              = module.network.vpc_id
  certificate_arn                     = module.certificate_manager.rpa_vt_lab_opetech_jp_certificate_arn
}

//** Route53 Module **//
module "techlab_management_fe_route53" {
  source = "../../modules/route53/techlab_management_fe"

  // Variables for the module
  techlab_management_lb_dns_name       = module.techlab_management_fe_load_balancer.lb_dns_name
  techlab_management_lb_zone_id        = module.techlab_management_fe_load_balancer.lb_zone_id
  domain_rpa_vt_lab_opetech_jp_zone_id = module.domain.domain_rpa_vt_lab_opetech_jp_zone_id
  domain_rpa_vt_lab_opetech_jp_name    = module.domain.domain_rpa_vt_lab_opetech_jp_name
}
