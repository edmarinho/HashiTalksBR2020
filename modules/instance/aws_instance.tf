resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id.id
  associate_public_ip_address = "true"
  user_data                     = var.user_data
  key_name                    = var.key_name
  security_groups             = var.security_groups

  tags = {
    Name = format("%s_WebServer", var.env)
  }
}