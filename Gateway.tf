resource "aws_internet_gateway" "my_vpc_igw" {
  vpc_id = aws_vpc.prod-vpc-project16.id

  tags = {
    Name = "My VPC - Internet Gateway"
  }
}
