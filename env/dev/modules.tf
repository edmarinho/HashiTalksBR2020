module "network" {
  source        = "../../modules/network"
  env           = var.env
  cidr_block_01 = "192.168.1.0/24"
  cidr_block_02 = "192.168.2.0/24"
}

module "WebServer_instance" {
  source          = "../../modules/instance"
  env             = var.env
  subnet_id       = module.network.subnet_public
  security_groups = [module.WebServer_security_group.sg.id, ]
  key_name        = "HashiTalksBR2020"
  user_data       = file("./script.sh")
}

module "WebServer_security_group" {
  source = "../../modules/security_group"
  env    = var.env
  vpc_id = module.network.vpc.id
}

module "WebServer_security_group_rule_8082" {
  source            = "../../modules/security_group_rule"
  type              = "ingress"
  from_port         = 8082
  to_port           = 8082
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Access to MongoDB Express (apache)"
  security_group_id = module.WebServer_security_group.sg.id
}

module "WebServer_security_group_rule_22" {
  source            = "../../modules/security_group_rule"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Access to SSH"
  security_group_id = module.WebServer_security_group.sg.id
}

module "WebServer_security_group_rule_8080" {
  source            = "../../modules/security_group_rule"
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Access to nginx"
  security_group_id = module.WebServer_security_group.sg.id
}

module "WebServer_security_group_rule_9090" {
  source            = "../../modules/security_group_rule"
  type              = "ingress"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Access to Apache"
  security_group_id = module.WebServer_security_group.sg.id
}

module "WebServer_security_group_rule_27017" {
  source            = "../../modules/security_group_rule"
  type              = "ingress"
  from_port         = 27017
  to_port           = 27017
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Access to MongoDB (nginx)"
  security_group_id = module.WebServer_security_group.sg.id
}

module "WebServer_security_group_rule_8081" {
  source            = "../../modules/security_group_rule"
  type              = "ingress"
  from_port         = 8081
  to_port           = 8081
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Access to MongoDB Express (nginx)"
  security_group_id = module.WebServer_security_group.sg.id
}

module "WebServer_security_group_rule_27018" {
  source            = "../../modules/security_group_rule"
  type              = "ingress"
  from_port         = 27018
  to_port           = 27018
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "Access to MongoDB (apache)"
  security_group_id = module.WebServer_security_group.sg.id
}