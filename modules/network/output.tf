output "pub_subnet_id_1a" {
  value = data.aws_subnet.subnet_public_1a.id
}

output "pub_subnet_id_1c" {
  value = data.aws_subnet.subnet_public_1c.id
}

output "vpc_id" {
  value = data.aws_vpc.poc_vpc.id
}

output "techlab_management_fe_security_group_ecs_task_service" {
  value = aws_security_group.techlab_management_fe_allow_http.id
}
output "techlab_homepage_fe_security_group_ecs_task_service" {
  value = aws_security_group.techlab_homepage_fe_allow_http.id
}

output "techlab_homepage_fe_sercurity_group_allow_https_id" {
  value = aws_security_group.techlab_homepage_fe_allow_https.id
}
output "techlab_management_fe_sercurity_group_allow_https_id" {
  value = aws_security_group.techlab_management_fe_allow_https.id
}
