locals {
  aws_ecr_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.us-east-2.amazon.com/${aws_ecr_repository.wallace-ecr.name}"
  
  tags = {
    created_using = "terraform"
  }
}
