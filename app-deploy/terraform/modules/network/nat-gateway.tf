resource "aws_nat_gateway" "app-nat-gateway" {
    subnet_id     = aws_subnet.Private_subnet.id

  tags = {
    Name = "app-wallace-Nat-Gateway"
  }

  depends_on = [aws_internet_gateway.aws_internet_gateway.internet_gatway]
}