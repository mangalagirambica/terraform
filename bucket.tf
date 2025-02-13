terraform {
  backend "s3" {
    bucket = "mybuck"
    key = "sample/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "null_resource" "test" {}