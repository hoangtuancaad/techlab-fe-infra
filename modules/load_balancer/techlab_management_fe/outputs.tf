output "techlab_management_load_balancer_target_group_arn" {
  value = aws_lb_target_group.target_group_techlab_management.arn
}


output "lb_dns_name" {
  value = aws_lb.load_balancer_techlab_management.dns_name
}

output "lb_zone_id" {
  value = aws_lb.load_balancer_techlab_management.zone_id
}
