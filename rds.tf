resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.database_subnet_1.id, aws_subnet.database_subnet_2.id]

  tags = {
    Name = "My subnet group"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage      = 20
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = "mysql"
  engine_version         = "8.0.32" 
  instance_class         = "db.t3.micro" 
  multi_az               = true 
  db_name                = "mydb"
  username               = "adminuser"          
  password               = "balajibalu" 
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_sg.id]

  tags = {
    Name = "My RDS Instance"
  }
}
