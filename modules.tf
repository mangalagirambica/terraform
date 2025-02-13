##mkdir modules
##mkdir modules/ec2
##mkdir modules/route53
##vi modules/main.tf
variable "instances" {
  default = [
    "test1",
    "test2"
  ]
}

module "ec2" {
  count = length(var.instances)
  source = "./ec2"
  instance_name = var.instances[count.index]
}
output "ip" {
  value = "module.ec2"
}
module "route53" {
  count = length(var.instances)
  source = "./route53"
  instance_name = var.instances[count.index]
  ip_address = module.ec2[count.index].ip_address
}

###vi modules/ec2/main.tf
resource "aws_instance" "instance" {
  ami = "ami-xxx"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-xx"]
  tags = {
    Name = var.instance_name
  }
}
variable "instance_name" {}
output "ip_address" {
  value = aws_instance.instance.private_ip
}
##output in child module won't print on screen
## output in root module will print on screen as output


##vi modules/rote53/main.tf
resource "aws_route53_record" "record" {
  name    = "${var.instance_name}-dev.awsbatch1.com"
  type    = "A"
  ttl = "30"
  zone_id = "99999"
  records = [var.ip_address]
}

variable "instance_name" {}
variable "ip_address" {}