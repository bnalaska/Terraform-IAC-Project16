resource "aws_route_table" "my_vpc_us_east_1_public" {
  vpc_id = aws_vpc.prod-vpc-project16.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.my_vpc_igw.id
  }

  tags = {
    Name = "Public Subnet Route Table."
  }
}

resource "aws_route_table" "my_vpc_us_east_1_private" {
  vpc_id = aws_vpc.prod-vpc-project16.id

  route {
    cidr_block = "0.0.0.0/24"
    gateway_id = aws_internet_gateway.my_vpc_igw.id
  }

  tags = {
    Name = "private Subnet Route Table."
  }
}

resource "aws_route_table_association" "my_vpc_us_east_1_public1" {
  subnet_id      = aws_subnet.prod-subnet-public-1.id
  route_table_id = aws_route_table.my_vpc_us_east_1_public.id
}

resource "aws_route_table_association" "my_vpc_us_east_1_public2" {
  subnet_id      = aws_subnet.prod-subnet-public-2.id
  route_table_id = aws_route_table.my_vpc_us_east_1_public.id
}

resource "aws_route_table_association" "my_vpc_us_east_1_private1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.my_vpc_us_east_1_private.id
}

resource "aws_route_table_association" "my_vpc_us_east_1_private2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.my_vpc_us_east_1_private.id
}
