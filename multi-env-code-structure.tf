###mkdir multi-env-code-structure
##cd multi-env-code-structure
##touch main.tf
## mkdir env-dev ; touch env-dev/main.tfvars
##mkdir env-prod ; touch env-prod/main.tfvars
##mkdir modules ; touch modules/main.tf
##touch modules/variables.tf
##touch modules/state.tf
##mkdir modules/ec2
##touch modules/ec2/main.tf
##vi env-dev/main.tfvars
env = "dev"
##vi env-prod/main.tfvars
env = "prod"
##vi modules/variables.tf
variable "env" {}
##vi modules/env-dev/state.tfvars
bucket = "terraform-d88"
key = "sample/dev/terraform.tfstate"
region = "us-east-1"

##vi modules/env-prod/state.tfvars
bucket = "terraform-d88"
key = "sample/prod/terraform.tfstate"
region = "us-east-1"

##vi modules/state.tf
terraform {
  backend "s3" {
      }
}
##vi modules/ec2/main.tf
resource "aws_instance" "instance" {
  ami = "ami-xx"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-xx"]
  tags = {
    Name = "test-${var.env}"
  }
}
variable "env" {}

##vi modules/main.tf
module "ec2" {
  source = "./modules/ec2"
  env = var.env
 }

####vi modules/makefile
default:
        rm -rf .terraform
        terraform init -backend-config=env-$(env)/state.tfvars
        terraform apply -auto-approve -var-file=env-$(env)/main.tfvars

dev-apply:
rm -rf .terraform
terraform init -backend-config=env-dev/state.tfvars
terraform apply -auto-approve -var-file=env-dev/main.tfvars

dev-destroy:
rm -rf .terraform
terraform init -backend-config=env-dev/state.tfvars
terraform apply -auto-approve -var-file=env-dev/main.tfvars


prod-apply:
rm -rf .terraform
terraform init -backend-config=env-prod/state.tfvars
terraform apply -auto-approve -var-file=env-prod/main.tfvars

prod-destroy:
rm -rf .terraform
terraform init -backend-config=env-prod/state.tfvars
terraform apply -auto-approve -var-file=env-prod/main.tfvars




####make env=dev action=apply
####make env=prod action=apply