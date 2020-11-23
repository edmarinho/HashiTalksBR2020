variable name {
  type        = string
  description = "Nome dos recursos"
}

variable instance_type {
  type        = string
  description = "Tipo da minha instancia"
  default     = "t3.small"
}

variable key_name {
  type = string
  default = "HashiTalksBR2020"
}

variable prefix_name {
  type = string
}