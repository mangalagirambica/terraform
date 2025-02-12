##mkdir -p modules
## cd modules
##mkdir module

####vi modules/module/main.tf
resource "null_resource" "test1" {}
resource "null_resource" "test2" {}
resource "null_resource" "test3" {}

##vi main.tf
module "test" {
  source = "./module"

}