resource "aws_security_group" "WebServer" {
  name_prefix = format("%s_WebServer_", var.env)
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format("%s_WebServer", var.env)
  }
}