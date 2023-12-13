resource "aws_instance" "app_instance-wallace-terraform" {
  ami = var.instance_ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  
  tags = {
    Name = "app-instance-wallace-terraform"
  }  
}