resource "aws_ecs_task_definition" "techlab_management_fe" {
  family                   = aws_ecs_cluster.cluster.name
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 256
  memory                   = 512
  container_definitions = jsonencode([
    {
      name      = "techlab-management-fe"
      image     = "${var.ecr_uri}:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/aws/ecs/${aws_ecs_cluster.cluster.name}"
          awslogs-create-group  = "true"
          awslogs-region        = var.logs_region
          awslogs-stream-prefix = "api"
        },
        secrets = [
          {
            name      = "NEXTAUTH_SECRET"
            valueFrom = "${var.secret_arn}:NextAuthSecret::"
          }
        ]
        secretOptions = []
      }
    },
  ])

  # This role allows your application code (on the container) to use other AWS services
  task_role_arn = var.ecs_task_container_role_arn

  # The task execution role grants the Amazon ECS container and Fargate agents permission to make AWS API calls on your behalf.
  execution_role_arn = var.ecs_task_execution_role_arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }

  ephemeral_storage {
    size_in_gib = 21
  }

  tags = {
    Environment = var.environment_name
    Purpose     = "service"
    SystemName  = "techlab-management"
    ProductName = "opegpt"
    ProductCode = "opetech-vt"
    StackName   = "ecs-task-definition-fargate"
  }
}
