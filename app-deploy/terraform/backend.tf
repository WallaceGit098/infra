terraform {
  backend "s3" {
    bucket = "app-storage-wallace-terraform"
    key    = "tfstate/terraform.tfstate"
    region = "us-east-2"
  }
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}