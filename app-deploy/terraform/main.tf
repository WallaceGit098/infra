#VPC
resource "aws_vpc" "app_vpc-wallace-terraform" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "app-vpc-wallace"
  }
}
#Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.app_vpc-wallace-terraform.id
  cidr_block = var.public_subnet_cidr

  tags = {

    Name = "Public-Subnet"
  }
}
#Private Subnet
resource "aws_subnet" "Private_subnet" {
  vpc_id     = aws_vpc.app_vpc-wallace-terraform.id
  cidr_block = var.private_subnet_cidr

  tags = {

    Name = "Private-Subnet"
  }
}
#Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.app_vpc-wallace-terraform.id

  tags = {
    Name = "app-vpc-wallace-Internet-Gateway"
  }
}
#Public RoutTable
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.app_vpc-wallace-terraform.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "Public-Route-Table"
  }
}
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

#Public RouteTable Association 
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}

#Elastic IP
resource "aws_eip" "nat_gateway_elastic_ip" {
  domain = "vpc"

  tags = {
    Name = "wallace-Elastic_IP"
  }
}

#Nat Gateway
resource "aws_nat_gateway" "app-nat-gateway" {
  allocation_id = aws_eip.nat_gateway_elastic_ip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "app-wallace-Nat-Gateway"
  }

  depends_on = [aws_internet_gateway.internet_gateway]
}
########################################################

#ECR
resource "aws_ecr_repository" "wallace-ecr" {
  name = "wallace-app-ecr"
}

resource "docker_image" "app-image" {
  name = "app-image"
  build {
    context = "../"
  }
  depends_on = [ aws_ecr_repository.wallace-ecr ]
}

resource "null_resource" "push_image_to_ecr" {
  triggers = {
    ecr_repository_id = aws_ecr_repository.wallace-ecr.id
  }
  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
  command = <<-EOT
   
    aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.id}.dkr.ecr.us-east-2.amazonaws.com
    docker tag ${docker_image.app-image.name}:app-image ${data.aws_caller_identity.current.id}.dkr.ecr.us-east-2.amazonaws.com/${aws_ecr_repository.wallace-ecr.name}:latest
    # command = "docker push ${aws_ecr_repository.wallace-ecr.repository_url}:latest"
  EOT
  } 
}

#########################################


# #s3
# resource "aws_s3_bucket" "app_storage" {
#   bucket = var.bucket
# }

# #tfstate Bucket Versioning
# resource "aws_s3_bucket_versioning" "app_storage_versioning" {
#   bucket = aws_s3_bucket.app_storage.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }

#elastic ip

#Security Group(Defaul)
# resource "aws_default_security_group" "default" {
#   vpc_id = aws_vpc.app_vpc-wallace-terraform.id

#   ingress {
#     protocol  = -1
#     self      = true
#     from_port = 0
#     to_port   = 0
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
#EC2
# resource "aws_instance" "app_instance-wallace-terraform" {
#   ami = var.instance_ami
#   instance_type = var.instance_type
#   subnet_id = aws_subnet.public_app_subnet-wallace-terraform.id
#   depends_on = [ 
#     aws_vpc.app_vpc-wallace-terraform,
#     aws_subnet.public_app_subnet-wallace-terraform
#     ]
#   tags = {
#     Name = "app-instance-wallace-terraform"
#   }  
# }

