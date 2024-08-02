output "techlab_homepage_load_balancer_target_group_arn" {
  value = aws_lb_target_group.target_group_techlab_homepage.arn
}


output "lb_dns_name" {
  value = aws_lb.load_balancer_techlab_homepage.dns_name
}

output "lb_zone_id" {
  value = aws_lb.load_balancer_techlab_homepage.zone_id
}
