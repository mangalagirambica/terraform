
resource "local_file" "cyberpunk" {
filename     = "/root/cyberpunk2077.txt"
content  = "All I need for Christmas is Cyberpunk 2077!"
}

resource "local_file" "ps5" {
filename     = "/root/ps5.txt"
content  = "And a PS5!"
}


resource "local_file" "xbox" {
  filename     = "/root/xbox.txt"
  content  = "Wouldn't mind an XBox either!"
}

terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.13.3"
    }
  }
}

terraform {
  required_providers {
    ansible = {
      source = "nbering/ansible"
      version = "1.0.4"
    }
  }
}

resource "local_file" "things-to-do" {
  filename     = "/root/things-to-do.txt"
  content  = "Clean my room before Christmas\nComplete the CKA Certification!"
}
resource "local_file" "more-things-to-do" {
  filename     = "/root/more-things-to-do.txt"
  content  = "Learn how to play Astronomia on the guitar!"
}

##multi provider
resource "local_file" "pet_name" {
  content = "We love pets!"
  filename = "/root/pets.txt"
}
resource "random_pet" "my-pet" {
  prefix = "Mrs"
  separator = "."
  length = "1"
}

resource "local_file" "my-pet" {
  content = "My pet is called finnegan!!"
  filename = "/root/pet-name"
}
resource "random_pet" "other-pet" {
  prefix = "Mr"
  separator = "."
  length = "1"
}

resource "aws_instance" "ec2_instance" {
  ami       =  "ami-0eda277a0b884c5ab"
  instance_type = "t2.large"
}


resource "aws_ebs_volume" "ec2_volume" {
  availability_zone = "eu-west-1"
  size  =    10
}

resource "local_file" "data" {
  filename = "/root/k8s.txt"
  content = "kubernetes the hard way!"
}


resource "kubernetes_namespace" "dev" {
  metadata {
    name = "development"
  }
}


resource "local_file" "iac_code" {
  filename = "/opt/practice"
  content = "Setting up infrastructure as code"
}

resource "local_file" "iac_code" {
  filename = "/opt/practice"
  content = "Setting up infrastructure as code"
}


resource "random_string" "iac_random" {
  length = 10
  min_upper = 5
}
