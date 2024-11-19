# Create database Security Group
resource "aws_security_group" "database_sg" {
  name        = "Database SG"
  description = "Allow inbound traffic from application layer"
  vpc_id      = aws_vpc.demovpc.id

  # Inbound Rule: Allow traffic from application layer on port 3306
  ingress {
    description = "Allow traffic from application layer"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.demosg.id] # Allowing traffic from the demo security group
  }

  # Outbound Rule: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # Allow all protocols
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic to anywhere
  }

  tags = {
    Name = "Database SG"
  }
}
