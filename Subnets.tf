resource "aws_subnet" "prod-subnet-public-1" {
  vpc_id                  = aws_vpc.prod-vpc-project16.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "us-east-1a"
  tags = {
    Name = "prod-subnet-public-1"
  }
}

resource "aws_subnet" "prod-subnet-public-2" {
  vpc_id                  = aws_vpc.prod-vpc-project16.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true" //it makes this a public subnet
  availability_zone       = "us-east-1b"
  tags = {
    Name = "prod-subnet-public-2"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id                  = aws_vpc.prod-vpc-project16.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "false" //makes this private subnet
  tags = {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id                  = aws_vpc.prod-vpc-project16.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = "false" //makes this private subnet
  tags = {
    Name = "private_subnet2"
  }
}

# Create RDS Subnet group
#resource "aws_db_subnet_group" "db-subnet" {
#name = "DB subnet group"
#subnet_ids = ["${aws_subnet.private_subnet1.id}", "${aws_subnet.private_subnet2.id}"]}

resource "aws_db_subnet_group" "project16" {
  name        = "project16-rds-subnet-group"
  description = "Database subnet groups"
  subnet_ids  = ["${aws_subnet.private_subnet1.id}", "${aws_subnet.private_subnet2.id}"]
}
