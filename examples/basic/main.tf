terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "random_pet" "bucket" {
}

module "tfstate_backend" {
  source = "github.com/opsd-io/terraform-module-aws-backend"

  bucket_name = "terraform-state-${random_pet.bucket.id}"
  common_tags = {
    Env = "Testing"
  }
  iam_policy_path = "/devops/"
}

output "tfstate_backend" {
  value = module.tfstate_backend
}

output "backend_config" {
  value     = <<-EOF
    terraform {
      backend "s3" {
        # Use ${module.tfstate_backend.state_access_policy_arn} policy to access it.
        region         = "${module.tfstate_backend.region}"
        bucket         = "${module.tfstate_backend.bucket_name}"
        dynamodb_table = "${module.tfstate_backend.dynamodb_table_name}"
      }
    }
  EOF
  sensitive = false

}
