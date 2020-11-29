resource "aws_security_group" "WebServer" {
  name_prefix = format("%s_WebServer_", var.env)
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = local.security_rules_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      security_groups = ingress.value.security_groups
    }
  }

  dynamic "egress" {
    for_each = local.security_rules_egress
    content {
      description = egress.value.description
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      security_groups = egress.value.security_groups
    }
  }

  tags = {
    Name = format("%s_WebServer", var.env)
  }
}