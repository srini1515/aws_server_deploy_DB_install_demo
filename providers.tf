terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  cloud {
    organization = "srinivasanmani1515"

    workspaces {
      name = "aws-linux-demo"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region = "ap-south-2"
}
