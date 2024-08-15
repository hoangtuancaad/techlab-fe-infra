resource "aws_lb" "load_balancer_techlab_management" {
  name               = "opegpt-${var.environment_name}-techlab-management-fe"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.aws_security_group_load_balancer_id]
  subnets = [
    var.subnet_1a_load_balancer_id,
    var.subnet_1c_load_balancer_id
  ]

  enable_deletion_protection = false

  tags = {
    Environment = var.environment_name,
    SystemName  = "techlab-management-fe"
  }
}

