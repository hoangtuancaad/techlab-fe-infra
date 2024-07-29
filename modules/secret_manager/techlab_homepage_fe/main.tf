resource "aws_secretsmanager_secret" "secret" {
  name                    = "opegpt-${var.environment_name}-techlab-homepage-fe-environmentss"
  recovery_window_in_days = 0
}

