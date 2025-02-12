variable "instances" {
  default = [
    "frontend",
    "cart",
    "catalogue",
    "user",
    "shipping",
    "payment",
    "rabbitmq",
    "mongodb",
    "rabbitmq",
    "redis"
  ]
}

resource aws_instance" "instance" {
  count = length(var.instances)
  ami = "i-xxx"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-xx"]
  tags = {
    Name = var.instances[count.index]
  }
}

resource "aws_route53_record" "frontend" {
  count = length(var.instances)
  name    = "frontend.awsbatch1.com"
  type    = "A"
  zone_id = "xxx"
  ttl = "30"
  records = [aws_instance.instance[count.index].private_ip]
}