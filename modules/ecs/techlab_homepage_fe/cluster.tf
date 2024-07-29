resource "aws_ecs_cluster" "cluster" {
  name = "opegpt-${var.environment_name}-techlab-homepage-fe"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
