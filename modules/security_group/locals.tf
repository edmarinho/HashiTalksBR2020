locals {
    security_rules_ingress = [for rule in var.rules_ingress : {
        from_port = lookup(rule,"from_port",null)
        description = lookup(rule,"description",null)
        protocol = lookup(rule,"protocol",null)
        to_port = lookup(rule,"to_port",null)
        cidr_blocks = lookup(rule,"cidr_blocks",null)
        security_groups = lookup(rule,"security_groups",null)
        }
    ]

    security_rules_egress = [for rule in var.rules_egress : {
        from_port = lookup(rule,"from_port",null)
        description = lookup(rule,"description",null)
        protocol = lookup(rule,"protocol",null)
        to_port = lookup(rule,"to_port",null)
        cidr_blocks = lookup(rule,"cidr_blocks",null)
        security_groups = lookup(rule,"security_groups",null)
        }
    ]

}