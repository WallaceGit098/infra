resource "aws_acm_certificate" "certificate" {
  domain_name       = "app-wallace.dev.ezops.com.br"
  validation_method = "DNS"

  tags = {
    Environment = "test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

#Certificate Validation
resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.certificate : record.fqdn]
}