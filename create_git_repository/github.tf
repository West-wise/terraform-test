data "external" "config_data" {
  program = ["python", "${path.module}/../get_config.py"]
}


terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = data.external.config_data.result["github_token"]
}

resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"
  visibility = "public"
}