# service for repo api
resource "aws_ecs_service" "techlab_homepage_service" {
  name            = "opegpt-${var.environment_name}-techlab-homepage-fe"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.techlab_homepage_fe.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "techlab-homepage-fe"
    container_port   = 80
  }

  network_configuration {
    subnets          = [var.public_subnet_id]
    security_groups  = [var.security_group_ecs_task_service]
    assign_public_ip = true
  }
}
