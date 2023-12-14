resource "aws_eip" "wallace-eip" {
  domain = "vpc"
}

# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = var.instance_id
#   allocation_id = aws_eip.wallace-eip.id
# }

