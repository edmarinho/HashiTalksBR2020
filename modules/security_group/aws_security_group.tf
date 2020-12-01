resource "aws_security_group" "WebServer" {
  name_prefix = format("%s_WebServer_", var.env)
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.rules_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.rules_egress
    content {
      description = egress.value["description"]
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }

  tags = {
    Name = format("%s_WebServer", var.env)
  }
}