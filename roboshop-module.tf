##mkdir roboshopmodule
##cd roboshopmodule
##mkdir module
##vi roboshopmodule/module/main.tf
resource aws_instance" "instance" {
  ami = "ami-xxx"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-xx"]
  tags = {
    Name = var.component_name
  }
}

resource "aws_route53_record" "record" {
  name    = "$(var.component_name)-dev.awsbatch1.com"
  type    = "A"
  zone_id = "xxx"
  ttl = "30"
  records = [aws_instance.instance.private_ip]
}

variable "component_name" {}

#######vi roboshopmodule/main.tf
module "roboshop" {
  for_each = var.instances
  source = "./module"
  component_name = each.key
}

variable "instances" {
  default = {
    frontend = {}
    cart = {}
    catalogue = {}
    user = {}
    shipping = {}
    payment = {}
    rabbitmq = {}
    mongodb = {}
    rabbitmq = {}
    redis = {}
  }
}