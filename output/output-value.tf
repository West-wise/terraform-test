provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_eip" "lb" {
  domain = "vpc"
}

output "publid-ip" {
  value = aws_eip.lb.public_ip
  #vaue = aws_eip.lb처럼 특정 속성을 지정하지 않을 경우 aws_eip.lb의 모든 속성을 출력한다.
}