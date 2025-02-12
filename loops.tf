terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.3"
    }
  }
}
resource "null_resource" "demo" {}

resource "null_resource" "demo1" {
  count = 10
}

###foreach
variable "fruits" {
  default = {
    apple = {}
    banana = {}
    orange = {}
  }
}

resource "null_resource" "fruits" {
  for_each = var.fruits
}