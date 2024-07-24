output "pub_subnet_id_1a" {
  value = data.aws_subnet.subnet_public_1a.id
}

output "techlab_management_fe_security_group_ecs_task_service" {
  value = aws_security_group.techlab_management_fe_allow_http.id
}
