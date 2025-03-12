resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_alb.id]
  subnets            = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}

resource "aws_launch_configuration" "app_launch_config" {
  name = "app-launch-config"
  image_id = "ami-0c55b159cbfafe1f0"  # Update with your AMI ID
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_alb.id]
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  vpc_zone_identifier  = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  launch_configuration = aws_launch_configuration.app_launch_config.id
  health_check_type    = "EC2"
  health_check_grace_period = 300
}
