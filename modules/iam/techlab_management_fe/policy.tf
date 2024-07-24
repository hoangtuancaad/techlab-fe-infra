# This role allows your application code (on the container) to use other AWS services
resource "aws_iam_policy" "techlab_management_ecs_task_container" {
  name = "opegpt-${var.environment_name}-techlab-management-fe-ecs-task-container"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "SecretsManagerGetSecretValue"
        Effect   = "Allow"
        Resource = [var.secert_arn]
        Action   = ["secretsmanager:GetSecretValue"]
      }
    ]
  })
}

# The task execution role grants the Amazon ECS container and Fargate agents permission to make AWS API calls on your behalf.
resource "aws_iam_policy" "techlab_management_ecs_task_execution" {
  name = "opegpt-${var.environment_name}-techlab-management-fe-ecs-task-execution"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "CreateLogStream"
        Effect   = "Allow"
        Resource = ["*"]
        Action = [
          "logs:CreateLogStream",
          "logs:DescribeLogStreams",
          "logs:CreateLogGroup"
        ]
      },
      {
        Sid      = "PutLogEvents"
        Effect   = "Allow"
        Resource = ["*"]
        Action = [
          "logs:GetLogEvents",
          "logs:PutLogEvents"
        ]
      },
      {
        Sid      = "GetAuthorizationToken"
        Effect   = "Allow"
        Resource = ["*"]
        Action   = ["ecr:GetAuthorizationToken"]
      },
      {
        Sid      = "GetImage"
        Effect   = "Allow"
        Resource = [var.ecr_arn]
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage"
        ]
      },
      {
        Sid      = "GetSecretValue"
        Effect   = "Allow"
        Resource = [var.secert_arn]
        Action   = ["secretsmanager:GetSecretValue"]
      }

    ]
  })
}
# erc pull
# get secret
# create log
