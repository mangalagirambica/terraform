terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
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

resource "local_file" "games" {
file     = "/root/favorite-games"
content  = "FIFA 21"
}

resource "local_file" "pets" {
  filename = "/root/pets.txt"
  content = "this for creation of pets file"
  file_permission = "0777"
}

resource "local_sensitive_file" "games" {
  filename     = "/root/favorite-games"
  content  = "FIFA 21"
  # sensitive_content = "FIFA 21"
}



