# role: ecsTaskExecutionRole (use custom policy)
# This role allows your application code (on the container) to use other AWS services
resource "aws_iam_role" "techlab_management_task_container_role" {
  name                = "opegpt-${var.environment_name}-techlab-management-fe-ecs-task-container"
  assume_role_policy  = data.aws_iam_policy_document.ecs_instance_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.techlab_management_ecs_task_container.arn]
}


# role: task role for container api
# The task execution role grants the Amazon ECS container and Fargate agents permission to make AWS API calls on your behalf.
resource "aws_iam_role" "techlab_management_task_execution_role" {
  name                = "opegpt-${var.environment_name}-techlab-management-fe-ecs-task-execution"
  assume_role_policy  = data.aws_iam_policy_document.ecs_instance_assume_role_policy.json
  managed_policy_arns = [aws_iam_policy.techlab_management_ecs_task_execution.arn]
}
