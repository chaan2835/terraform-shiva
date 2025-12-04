variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map
  default = {
    Environment = "Dev"
    Name        = "timing-vpc"
    terraform = "true"
  }
}

variable "igw_tags" {
    default = {
        Name = "timing"
        Environment = "Dev"
        terraform = "true"
    }
}

variable "public_subnet_tags" {
    default = {
        Name = "timing-public-subnet"
        Environment = "Dev"
        terraform = "true"
    }  
}

variable "private_subnet_tags" {
    default = {
        Name = "timing-private-subnet"
        Environment = "Dev"
        terraform = "true"
    }   
}

variable "public_route_table_tags" {
    default = {
        Name = "timing-public-rt"
        Environment = "Dev"
        terraform = "true"
    }  
}

variable "nat_tags" {
    default = {
        Name = "timing-nat-gateway"
        Environment = "Dev"
        terraform = "true"
    }  
}

variable "private_route_table_tags" {
    default = {
        Name = "timing-private-rt"
        Environment = "Dev"
        terraform = "true"
    }
}

variable "DB_subnet_tags" {
    default = {
        Name = "timing-db-subnet-group"
        Environment = "Dev"
        terraform = "true"
    }  
}