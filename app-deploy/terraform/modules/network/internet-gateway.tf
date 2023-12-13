resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.app_vpc-wallace-terraform.id

  tags = {
    Name = "app-vpc-wallace-Internet-Gateway"
  }
}