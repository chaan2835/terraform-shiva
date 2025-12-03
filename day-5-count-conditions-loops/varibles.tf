# Variable to hold AWS account IDs for different regions
variable "aws_accounts" {
  type = map(string)
  default = {
    ap-south-2 = "140264529686"
  }
}

variable "instances" {
  type = list 
  default = ["webserver", "appserver", "dbserver"]
}

variable "is_test" {
    type = bool
    default = true  
}

variable "servers" {
    type = map 
    default = {
        "webserver" = "t3.micro",
        "appserver" = "t3.medium",   
        "dbserver"  = "t3.large"
    } 
}

variable "instance_type" {
    type = string
    default = "webserver"
}

variable "Environment" {
    type = string
    default = "dev" 
}