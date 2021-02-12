variable "snmp_client_grp_defaults" {
  description = "Client Group, Mgmt Domain, and Associated EPG."
  type = object({
    epg  = string
    mgmt = string
    name = string
  })
  default = {
    epg  = "default"
    mgmt = "oob"
    name = "default_oob"
  }
}

variable "snmp_client_defaults" {
  description = "Associate a SNMP Client to a Client Group (AKA Management SNMP Access Control)."
  type = object({
    client     = string
    client_grp = string
    epg        = string
    mgmt       = string
  })
  default = {
    client     = "198.18.1.1"
    client_grp = "default_oob"
    epg        = "default"
    mgmt       = "oob"
  }
}

variable "snmp_client_grp" {
  description = "Map of settings to be be merged with the snmp_client_grp_defaults. Allowed keys are the same as for defaults."
}

variable "snmp_client" {
  description = "Map of settings to be be merged with the snmp_client_defaults. Allowed keys are the same as for defaults."
}

locals {
  merged_snmp_client_grp = merge(local.snmp_client_grp_defaults, var.snmp_client_grp)
  merged_snmp_client     = merge(local.snmp_client_defaults, var.snmp_client)
}