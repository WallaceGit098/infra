resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.app_vpc-wallace-terraform.id
  cidr_block = var.public_subnet_cidr[0]

  tags = {

    Name = "Public-Subnet"
  }
  availability_zone = "us-east-2a"
}
#2 public Subnet
resource "aws_subnet" "public_subnet_2" {
  vpc_id     = aws_vpc.app_vpc-wallace-terraform.id
  cidr_block = var.public_subnet_cidr[1]

  tags = {

    Name = "Public-Subnet"
  }
  availability_zone = "us-east-2b"
}
#Private Subnet
resource "aws_subnet" "Private_subnet" {
  vpc_id     = aws_vpc.app_vpc-wallace-terraform.id
  cidr_block = var.private_subnet_cidr

  tags = {

    Name = "Private-Subnet"
  }
}
