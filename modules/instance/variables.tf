variable subnet_id {}
variable security_groups {
    type = list
}
variable key_name {}
variable env {}
variable user_data {}

variable instance_type {
  type        = string
  description = "Tipo da minha instancia"
  default     = "t3.small"
}