resource "aws_ecs_cluster" "cluster" {
  name = "opegpt-${var.environment_name}-techlab-management-fe"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
