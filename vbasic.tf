
########how to declare a variable
variable "URL" {
  default = "example.con"
}
##access a variable
output "URL" {
  value = var.URL
}

# variable is a combination of some other string. then we have to use ${}
output "URL1" {
  value = "URL - ${var.URL}"
}