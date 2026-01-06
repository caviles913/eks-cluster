variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_username" {
  type    = string
  default = "appuser"
}

# variable "db_password" {
#   type      = string
#   sensitive = true
# }

# Your IP in CIDR form, e.g. "203.0.113.10/32"
variable "allowed_cidr" {
  type = string
}

variable "instance_class" {
  type    = string
}

variable "allocated_storage" {
  type    = number
  default = 20
}

variable "subnet_ids" {
  type = list(string)
}
variable "db_security_group_name" {
  type = string
}

variable "db_identifier" {
  type = string
}