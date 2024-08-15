# listener
resource "aws_lb_listener" "listener_techlab_management_http" {
  load_balancer_arn = aws_lb.load_balancer_techlab_management.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
resource "aws_lb_listener" "listener_techlab_management_https" {
  load_balancer_arn = aws_lb.load_balancer_techlab_management.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group_techlab_management.arn
  }
}
