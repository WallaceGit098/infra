resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.app_vpc-wallace-terraform.id
    cidr_block = element(var.public_subnet_cidr)

    tags = "Public Subnet"
}

resource "aws_subnet" "Private_subnet" {
  vpc_id = aws_vpc.app_vpc-wallace-terraform.id
  cidr_block = element(var.private_subnet_cidr)

  tags = "Private Subnet"
}