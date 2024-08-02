//** Techlab management Security group Module **//
resource "aws_security_group" "techlab_management_fe_allow_http" {
  name        = "opegpt-${var.environment_name}-common-ecs-task-service-techlab-management-fe"
  description = "ECS Service security group"
  vpc_id      = data.aws_subnet.subnet_public_1a.vpc_id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment_name,
    SystemName  = "techlab-management-fe"
  }
}

//** Homepage Security group Module **//
resource "aws_security_group" "techlab_homepage_fe_allow_http" {
  name        = "opegpt-${var.environment_name}-common-ecs-task-service-techlab-homepage-fe"
  description = "ECS Service security group"
  vpc_id      = data.aws_subnet.subnet_public_1a.vpc_id

  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment_name,
    SystemName  = "techlab-homepage-fe"
  }
}

resource "aws_security_group" "techlab_homepage_fe_allow_https" {
  name        = "opegpt-${var.environment_name}-common-elb-global-techlab-homepage-fe"
  description = "ELB global security group"
  vpc_id      = data.aws_subnet.subnet_public_1a.vpc_id

  ingress {
    description = "HTTPS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "HTTP from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Environment = var.environment_name,
    SystemName  = "techlab-management"
  }
}
