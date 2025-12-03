resource "aws_instance" "sample-instance-1" {
  ami           = "ami-0e7938ad51d883574" # ami id is diff for each region
  instance_type = "t3.micro" # specify which type of instance

  tags = {
    Name = "sample-instance-1" # tag to identify the instance 
  }
}