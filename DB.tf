resource "aws_db_instance" "project16" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_subnet_group_name = aws_db_subnet_group.project16.id
  db_name              = "test"
  username             = "test"
  password             = "testtest"
  skip_final_snapshot    = "true"
 }
