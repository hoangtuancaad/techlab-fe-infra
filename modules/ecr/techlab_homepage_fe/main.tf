resource "aws_ecr_repository" "main" {
  name                 = "opetech-ai/opegpt-${var.environment_name}-techlab-homepage-fe"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
