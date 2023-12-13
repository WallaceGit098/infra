resource "aws_lb_target_group" "alb-wallace-target-group" {
  name     = "wallace-app-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

