variable "project" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "ec2_sg_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}
