provider "aws" {
  region     = "ap-northeast-2"
  access_key = "PUT-YOUR_ACCESS_KEY_HERE"
  secret_key = "PUT-YOUR_SECRET_KEY_HERE"
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
