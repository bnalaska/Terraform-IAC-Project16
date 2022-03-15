resource "aws_elb" "web_elb-project16" {
  name = "web-elb-project16"
  security_groups = [
    aws_security_group.sglb-project16.id
  ]
  subnets = [
    aws_subnet.prod-subnet-public-1.id,
    aws_subnet.prod-subnet-public-2.id
  ]

  cross_zone_load_balancing   = true

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 30
    target = "HTTP:80/"
  }

  listener {
    lb_port = 80
    lb_protocol = "http"
    instance_port = "80"
    instance_protocol = "http"
  }

}
