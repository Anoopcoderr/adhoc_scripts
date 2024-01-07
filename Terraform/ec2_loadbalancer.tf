provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Specify the AMI ID for your preferred operating system
  instance_type = "t2.micro"               # Change this to your desired instance type

  tags = {
    Name = "example-instance"
  }
}

resource "aws_lb" "example_lb" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"

  enable_deletion_protection = false

  subnets         = ["subnet-xxxxxxxxxxxxxxxxx", "subnet-yyyyyyyyyyyyyyyyy"] # Specify your subnet IDs
  security_groups = ["sg-xxxxxxxxxxxxxxxxx"] # Specify your security group ID

  enable_cross_zone_load_balancing = true

  enable_http2        = true
  idle_timeout        = 60
}

resource "aws_lb_target_group" "example_target_group" {
  name        = "example-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"

  vpc_id = "vpc-xxxxxxxxxxxxxxxxx" # Specify your VPC ID
}

resource "aws_lb_listener" "example_listener" {
  load_balancer_arn = aws_lb.example_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      message_body = "OK"
    }
  }
}

resource "aws_lb_listener_rule" "example_listener_rule" {
  listener_arn = aws_lb_listener.example_listener.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.example_target_group.arn
  }

  condition {
    host_header {
      values = ["example.com"]
    }
  }
}
