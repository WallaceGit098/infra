resource "aws_eip" "nat_gateway_elastic_ip" {
  domain = "vpc"

  tags = {
    Name = "wallace-Elastic_IP"
  }
}