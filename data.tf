resource "aws_instance" "test" {
  ami = data.aws_ami.ami.id
  instance_type = "t3.small"
  vpc_security_group_ids = [data.aws_security_group.sg.id]
  tags = {
    Name = "test"
  }
}

data "aws_ami" "ami" {
  most_recent = true
  name_regex = "RHEL-9-DevOps-practice"
  owners = ["9999"]
}

data "aws_security_group" "sg" {
  name = "allow-all"
}