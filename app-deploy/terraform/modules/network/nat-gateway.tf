resource "aws_nat_gateway" "app-nat-gateway" {
  allocation_id = var.elastic_ip_id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "app-wallace-Nat-Gateway"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}