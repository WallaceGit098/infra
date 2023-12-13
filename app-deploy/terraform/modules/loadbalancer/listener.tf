resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.wallace-app-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-wallace-target-group.arn
  }
}
