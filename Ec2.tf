# Creating 1st EC2 instance in Public Subnet
resource "aws_instance" "demoinstance" {
  ami                    = "ami-0166fe664262f664c"  
  instance_type          = "t2.micro"
  count                  = 2
  key_name               = "devops"                
  vpc_security_group_ids = [aws_security_group.demosg.id]
  subnet_id              = aws_subnet.public_subnet_1.id
  associate_public_ip_address = true
  user_data              = file("data.sh")

  tags = {
    Name = "My Public Instance"
  }
}

# Creating 2nd EC2 instance in Public Subnet
resource "aws_instance" "demoinstance1" {
  ami                    = "ami-0166fe664262f664c"  
  instance_type          = "t2.micro"
  count                  = 1
  key_name               = "devops"                
  vpc_security_group_ids = [aws_security_group.demosg.id]
  subnet_id              = aws_subnet.public_subnet_2.id
  associate_public_ip_address = true
  user_data              = file("data.sh")

  tags = {
    Name = "My Public Instance 2"
  }
}
