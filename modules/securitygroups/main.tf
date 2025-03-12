resource "aws_security_group" "allow_alb" {
  name        = "allow_alb"
  description = "Allow ALB inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
