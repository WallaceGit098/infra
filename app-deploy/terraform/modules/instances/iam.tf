
resource "aws_iam_role" "instance_role" {
  name = "instance-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com",
        },
      },
    ],
  })
}

# Anexe a política AmazonEC2FullAccess à role
resource "aws_iam_role_policy_attachment" "instance_policy_attachment_EC2" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.instance_role.name
}
resource "aws_iam_role_policy_attachment" "instance_policy_attachment_ECR" {
policy_arn = "arn:aws:iam::975635808270:policy/ECRFULL"
role       = aws_iam_role.instance_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2FullAccess" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::975635808270:policy/ECRFULL"
  ])

  policy_arn = each.value
  role       = aws_iam_role.instance_role.name
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "ecr-role"
  role = aws_iam_role.instance_role.name
}