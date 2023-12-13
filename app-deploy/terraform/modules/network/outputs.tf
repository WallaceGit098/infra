output "public_subnet_id" {
    value = aws_subnet.public_subnet.id
}
output "public_subnet_id_2" {
    value = aws_subnet.public_subnet_2.id
}
output "vpc_id" {
    value = aws_vpc.app_vpc-wallace-terraform.id
}
output "vpc_cidr_block" {
    value = aws_vpc.app_vpc-wallace-terraform.cidr_block
}
