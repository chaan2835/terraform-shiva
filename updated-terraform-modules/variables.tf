variable "vpc_cidr" {
  type = string
}

variable "tags" {
  type = map 
}

variable "vpc_tags" {
  type = map 
  default = {}
}

variable "azs" {
  type = list
}

variable "public_subnet_cidr" {
  type = list 
}

variable "public_subet_tags" {
}