variable "project" {}
variable "region" {}
variable "my_ip" {}

variable "vpc_cidr" {}
variable "public_subnets" {
  type = list(string)
}
variable "azs" {
  type = list(string)
}
