resource "aws_vpc" "prod-vpc-project16" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My VPC"
  }
}
