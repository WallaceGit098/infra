resource "aws_lb_listener_rule" "host_based_routing" {
  listener_arn = aws_lb_listener.alb-listener.arn
  priority     = 1

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.alb-wallace-target-group.arn
  }

  condition {
    host_header {
      values = ["app-wallace.dev.ezops.com.br"]
    }
  }
}