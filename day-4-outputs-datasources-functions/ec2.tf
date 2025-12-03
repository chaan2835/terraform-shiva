resource "aws_instance" "sample-instance-1" {
  ami           = data.aws_ami.ami_info.image_id # ami id is diff for each region
  instance_type = "t3.micro" # specify which type of instance

  tags = {
    Name = "sample-instance-1" # tag to identify the instance 
  }
}