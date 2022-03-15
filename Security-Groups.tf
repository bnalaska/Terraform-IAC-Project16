resource "aws_security_group" "allow_ssh-project16" {
  name        = "allow_ssh_sg-project16"
  description = "Allow SSH inbound connections"
  vpc_id      = aws_vpc.prod-vpc-project16.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_sg-project16"
  }
}

resource "aws_security_group" "allow_http-project16" {
  name        = "allow_http_sg-project16"
  description = "Allow http inbound connections"
  vpc_id      = aws_vpc.prod-vpc-project16.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_http_sg-project16"
  }
}



resource "aws_security_group" "sglb-project16" {
  name        = "sglb-project16"
  description = "Allow 80 to public subnet resources"
  vpc_id = aws_vpc.prod-vpc-project16.id
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
   cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sglb-project16-allow-https-ssh"
  }
    lifecycle {
    create_before_destroy = true
  }
}
