

resource "aws_ecr_repository" "wallace-ecr" {
  name = "wallace-app-ecr"
}



resource "null_resource" "push_image_to_ecr" {
  triggers = {
    ecr_repository_id = aws_ecr_repository.wallace-ecr.id
  }

  provisioner "local-exec" {
    interpreter = ["/bin/bash", "-c"]
    command = <<-EOT
    
    cd ~/projetos/betha-training/app-deploy/
    docker build -t wallace-app .
    aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.id}.dkr.ecr.us-east-2.amazonaws.com
    docker tag wallace-app ${data.aws_caller_identity.current.id}.dkr.ecr.us-east-2.amazonaws.com/${aws_ecr_repository.wallace-ecr.name}:latest
    docker push ${aws_ecr_repository.wallace-ecr.repository_url}:latest
  EOT
  } 
}