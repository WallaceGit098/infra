provider "aws" {
  region = "us-east-2"
}
# provider "docker" {
#   host = "unix:///var/run/docker.sock"

#   registry_auth {
#     address  = local.aws_ecr_url
#     username = data.aws_ecr_authorization_token.token.user_name
#     password = data.aws_ecr_authorization_token.token.password
#   }
# }
provider "null" {

}