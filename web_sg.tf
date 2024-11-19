# Creating Security Group for Web Instances
resource "aws_security_group" "demosg" {
  vpc_id = aws_vpc.demovpc.id  # Ensure this is the correct VPC ID

  # Inbound Rules
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH traffic from anywhere (for testing, restrict in production)
  }

  # Outbound Rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

  tags = {
    Name = "Web SG"
  }
}

# Security Group for Load Balancer
resource "aws_security_group" "lb_sg" {
  vpc_id      = aws_vpc.demovpc.id  # Ensure this is the correct VPC ID
  name        = "lb-sg"
  description = "Security group for ALB"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

  tags = {
    Name = "LoadBalancer SG"
  }
}

# Security Group for EC2 Instances
resource "aws_security_group" "instance_sg" {
  vpc_id      = aws_vpc.demovpc.id  # Ensure this is the correct VPC ID
  name        = "instance-sg"
  description = "Security group for instances behind ALB"

  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]  # Allow traffic from ALB security group
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  }

  tags = {
    Name = "Instance SG"
  }
}
