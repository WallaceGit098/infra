resource "aws_internet_gateway" "internet_gatway" {
  vpc_id = aws_vpc.app_vpc-wallace-terraform.id

  tags = "app-vpc-wallace-Internet-Gateway"
}