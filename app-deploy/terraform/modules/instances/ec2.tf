resource "aws_instance" "app_instance-wallace-terraform" {
  ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.wallace-app-security-group.id]
  associate_public_ip_address = true
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name

  user_data = <<-EOT
    #!/bin/bash
    sudo yum update -y 

    sudo yum install docker -y

    sudo service docker start

    sudo usermod -a -G docker ec2-user

    aws ecr get-login-password --region us-east-2 | sudo docker login --username AWS --password-stdin 975635808270.dkr.ecr.us-east-2.amazonaws.com

    sudo docker run -d -p 5000:5000 975635808270.dkr.ecr.us-east-2.amazonaws.com/wallace-app-ecr:latest
  EOT
  
  tags = {
    Name = "app-instance-wallace-terraform"
  }  
  depends_on = [aws_security_group.wallace-app-security-group]
}
