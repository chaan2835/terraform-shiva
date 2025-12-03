# Variable to hold AWS account IDs for different regions
variable "aws_accounts" {
  type = map(string)
  default = {
    ap-south-2 = "140264529686"
  }
}