resource "aws_vpc" "app_vpc-wallace-terraform" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "app-vpc-wallace"
  }
}