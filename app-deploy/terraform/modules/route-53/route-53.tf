resource "aws_route53_record" "app-wallace" {
  zone_id = "ZG6FMT2OAHQ5L"
  name    = "app-wallace"
  type    = "CNAME"
  ttl     = 300
  records = [var.alb_dns_name]
}