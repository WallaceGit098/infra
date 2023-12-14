output "security_group_id" {
  value = aws_security_group.wallace-app-security-group.id
}
output "instance_id" {
  value = aws_instance.app_instance-wallace-terraform.id
}
