output "docker_public_ip" {
  value = module.WebServer_instance.instance.public_ip
}