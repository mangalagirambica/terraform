terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
resource "local_file" "pet" {
  filename = "/root/pets.txt"
  content = "hello how are you"
  file_permission = "777"
}

resource "aws_instance" "terr" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "data" {
  bucket = "feb-06-2025"
  acl = "private"
}