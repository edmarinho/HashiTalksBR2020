resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = "true"
  user_data                     = file("./script.sh")
  key_name                    = var.key_name
  security_groups             = [aws_security_group.WebServer.id, ]

  tags = {
    Name = var.name
  }
}