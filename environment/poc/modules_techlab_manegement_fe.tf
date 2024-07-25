module "techlab_management_fe_secret_manager" {
  source = "../../modules/secret_manager/techlab_management_fe"

  // Variables for the module
  environment_name = var.environment_name
}

module "techlab_management_fe_ecr" {
  source = "../../modules/ecr/techlab_management_fe"

  // Variables for the module
  environment_name = var.environment_name
}

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

module "techlab_management_fe_iam" {
  source = "../../modules/iam/techlab_management_fe"

  // Variables for the module
  environment_name = var.environment_name
  secert_arn       = module.techlab_management_fe_secret_manager.secret_arn
  ecr_arn          = module.techlab_management_fe_ecr.ecr_arn
}
