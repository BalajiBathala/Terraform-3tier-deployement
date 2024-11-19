# Creating 1st web subnet
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet_cidr_1
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Web Subnet 1"
  }
}

# Creating 2nd web subnet
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet_cidr_2
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Web Subnet 2"
  }
}

# Creating 1st application subnet
resource "aws_subnet" "application_subnet_1" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet_cidr_3
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"

  tags = {
    Name = "Application Subnet 1"
  }
}

# Creating 2nd application subnet
resource "aws_subnet" "application_subnet_2" {
  vpc_id                  = aws_vpc.demovpc.id
  cidr_block              = var.subnet_cidr_4
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags = {
    Name = "Application Subnet 2"
  }
}

# Creating 1st database subnet
resource "aws_subnet" "database_subnet_1" {
  vpc_id            = aws_vpc.demovpc.id
  cidr_block        = var.subnet_cidr_5
  availability_zone = "us-east-1a"

  tags = {
    Name = "Database Subnet 1"
  }
}

# Creating 2nd database subnet
resource "aws_subnet" "database_subnet_2" {
  vpc_id            = aws_vpc.demovpc.id
  cidr_block        = var.subnet_cidr_6
  availability_zone = "us-east-1b"

  tags = {
    Name = "Database Subnet 2"
  }
}
