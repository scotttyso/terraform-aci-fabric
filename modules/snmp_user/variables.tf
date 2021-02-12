terraform {
  experiments = [module_variable_optional_attrs]
}

variable "snmp_users" {
  description = "SNMP User Defination."
  type = object({
    snmp_user = string
    priv_type = optional(string)
    priv_key  = optional(string)
    auth_type = optional(string)
    auth_key  = string
  })
}

locals {
  default_snmp_users = {
    snmp_user = "user1"
    auth_key  = "cisco123"
  }
  merged_snmp_users = merge(local.default_snmp_users, var.snmp_users)
}