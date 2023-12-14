resource "aws_lb_target_group" "alb-wallace-target-group" {
  name     = "wallace-app-alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = aws_lb_target_group.alb-wallace-target-group.arn
  target_id        = var.instance_id
  port             = 5000
}
