#Private RoutTable
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.app_vpc-wallace-terraform.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_nat_gateway.app-nat-gateway.id
  }

  tags = {
    Name = "Private-Route-Table"
  }
}
#Private RouteTable Association 
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.Private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}