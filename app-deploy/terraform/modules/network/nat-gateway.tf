resource "aws_nat_gateway" "app-nat-gateway" {
  allocation_id = aws_eip.nat_gateway_elastic_ip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "app-wallace-Nat-Gateway"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}