data "external" "config_data" {
  program = ["python", "${path.module}/get_github_token.py"]
}

provider "aws" {
  region     = "ap-northeast-2"
  access_key = data.external.config_data.result["aws_access_key"]
  secret_key = data.external.config_data.result["aws_secret_key"]
}


terraform {
  required_providers {
    ncloud = {
      source = "NaverCloudPlatform/ncloud"
    }
  }
  required_version = ">= 0.13"
}

resource "aws_instance" "myec2" {
  ami = "ami-094efa69961183fa4"
  instance_type = "t2.micro"

  tags = {
    Name = "my-first-ec2"
  }
}

provider "azurerm" {
  
}