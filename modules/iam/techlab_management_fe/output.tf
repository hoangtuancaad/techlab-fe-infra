output "techsup_task_container_role_arn" {
  value = aws_iam_role.techlab_management_task_container_role.arn
}

output "techsup_task_execution_role_arn" {
  value = aws_iam_role.techlab_management_task_execution_role.arn
}
