variable "cidr_block" { # declering the name of the variable
    description = "The CIDR block for the VPC" # description of the variable
    type        = string  
}

variable "public_subnet_cidr" {
    description = "The CIDR block for the public subnet"
    type        = string  
}

variable "private_subnet_cidr" {
    description = "The CIDR block for the private subnet"
    type        = string  
}

variable "route_table_cidr_block" {
  description = "The CIDR block for the route table"
  type        = string  
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map
}

variable "internet" {
  type = bool
}

variable "lb_type" {
  type = string
}

variable "subnet_ids" {
  type = list
}

variable "security_groups" {
  type = list
}

variable "timeout" {
  type = number
}