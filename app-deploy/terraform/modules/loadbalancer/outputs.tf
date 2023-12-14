output "alb_dns_name" {
  value = aws_lb.wallace-app-alb.dns_name
}

output "elastic_ip_id" {
  value = aws_eip.wallace-eip.id
}

