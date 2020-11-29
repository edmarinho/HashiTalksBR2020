module "network" {
  source = "../../modules/network"
  env = var.env
  cidr_block_01 = "192.168.1.0/24"
  cidr_block_02 = "192.168.2.0/24"
}

module "WebServer_instance" {
  source = "../../modules/instance"
  env = var.env
  subnet_id = module.network.subnet_public
  security_groups = [module.WebServer_security_group.sg.id,]
  key_name = "HashiTalksBR2020"
  user_data                     = file("./script.sh")
}

module "WebServer_security_group" {
  source = "../../modules/security_group"
  env = var.env
  vpc_id = module.network.vpc.id
  rules_ingress = {
    1 = { description = "Access to SSH", protocol = "tcp", from_port = "22", to_port = "22", cidr_blocks = ["0.0.0.0/0"] }
    2 = { description = "Access to nginx", protocol = "tcp", from_port = "8080", to_port = "8080", cidr_blocks = ["0.0.0.0/0"] }
    3 = { description = "Access to MongoDB (nginx)", protocol = "tcp", from_port = "27017", to_port = "27017", cidr_blocks = ["0.0.0.0/0"] }
    4 = { description = "Access to MongoDB Express (nginx)", protocol = "tcp", from_port = "8081", to_port = "8081", cidr_blocks = ["0.0.0.0/0"] }
    5 = { description = "Access to Apache", protocol = "tcp", from_port = "9090", to_port = "9090", cidr_blocks = ["0.0.0.0/0"] }
    6 = { description = "Access to MongoDB (apache)", protocol = "tcp", from_port = "27018", to_port = "27018", cidr_blocks = ["0.0.0.0/0"] }
    7 = { description = "Access to MongoDB Express (apache)", protocol = "tcp", from_port = "8082", to_port = "8082", cidr_blocks = ["0.0.0.0/0"] }
  }
  rules_egress = {
    1 = { description = "Acess to out instance", protocol = "tcp", from_port = "0", to_port = "65535", cidr_blocks = ["0.0.0.0/0"] }
  }
}