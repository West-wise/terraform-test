provider "aws" {
  region = "ap-northeast-2"
}
resource "aws_eip" "lb" {
  domain = "vpc"
}