resource "aws_lb" "wallace-app-alb" {
  name               = "wallace-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_group_id]
  subnets            = [var.public_subnet_id, var.public_subnet_id_2]
  

  enable_deletion_protection = false

}