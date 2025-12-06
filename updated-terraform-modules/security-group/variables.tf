variable "security_group_name" {
  type = string
}

variable "security_group_description" {
  type = string
}

variable "security_group_tags" {
  type = map 
  default = {}
}

variable "tags" {
  type = map 
}

variable "vpc_id" {
  type = string
}

variable "ingress_with_cidr" {
  type = list(map(string))
  default = []
}