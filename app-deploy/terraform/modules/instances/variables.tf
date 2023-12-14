variable "instance_ami" {
  type    = string
  default = "ami-06d4b7182ac3480fa"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

#PUBLIC_SUBNET
variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

#PRIVATE SUBNET
variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}
variable "public_subnet_id" {
  type = string
}
variable "vpc_id" {
  type = string
}
variable "vpc_cidr_block" {
  type = string
}
