data "external" "config_data" {
  program = ["python", "${path.module}/../get_config.py"]
}

provider "aws" {
  region     = "ap-northeast-2"
  # access_key = data.external.config_data.result["aws_access_key"]
  # secret_key = data.external.config_data.result["aws_secret_key"]
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


locals{
  common_tags = {
    Owner = "DevOps Team"
    service = "backend"
  }
}

locals{
  name_prefix = "${var.name != "" ? var.name : var.default}"
  instance_ids = concat(aws_instance.blue.*.id,aws_instance.green.*.id)
}
variable "elb_names"{
  type = list
  default = ["dev-loadbalancer", "statg-loadbalancer", "prod-loadbalancer"]
}


resource "aws_instance" "app_dev" {
  ami = "ami-082b5a644766e0e6f"
  instance_type = "t2.micro"
  tags = local.common_tags
}
resource "aws_iam_user" "name" {
  name = var.elb_names[count.index]
  count = 3
  path = "/system/"
}
# terraform {
#   required_providers {
#     ncloud = {
#       source = "NaverCloudPlatform/ncloud"
#     }
#   }
#   required_version = ">= 0.13"
# }

resource "aws_instance" "myec2-test" {
  ami = "ami-094efa69961183fa4"
  instance_type = "t2.micro"
}
