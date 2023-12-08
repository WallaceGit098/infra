#PUBLIC_SUBNET
variable "public_subnet_cidr" {
  type = "string"
  default = ["10.0.1.0/24"]
}

#PRIVATE SUBNET
variable "private_subnet_cidr" {
  type = "string"
  default = ["10.0.2.0/24"]
}
