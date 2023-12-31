#PUBLIC_SUBNET
variable "public_subnet_cidr" {
  type = list(string)
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

#PRIVATE SUBNET
variable "private_subnet_cidr" {
  type = string
  default = "10.0.3.0/24"
}
variable "elastic_ip_id" {
  type = string
}