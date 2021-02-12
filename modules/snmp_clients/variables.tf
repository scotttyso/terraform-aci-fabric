variable "snmp_client_grp_defaults" {
  description = "Client Group, Mgmt Domain, and Associated EPG."
  type = object({
    name = string
    mgmt = string
    epg  = string
  })
  default = {
    name = "default_oob"
    mgmt = "oob"
    epg  = "default"
  }
}

variable "snmp_client_defaults" {
  description = "Associate a SNMP Client to a Client Group (AKA Management SNMP Access Control)."
  type = object({
    client_grp = string
    client     = string
    mgmt       = string
    epg        = string
  })
  default = {
    client_grp = "default_oob"
    client     = "198.18.1.1"
    mgmt       = "oob"
    epg        = "default"
  }
}

variable "snmp_client_grp" {
  description = "Map of settings to be be merged with the defaults. Allowed keys are the same as for defaults."
}

variable "snmp_client" {
  description = "Map of settings to be be merged with the defaults. Allowed keys are the same as for defaults."
}

locals {
  merged_snmp_client_grp = merge(local.snmp_client_grp_defaults, var.snmp_client_grp)
  merged_snmp_client     = merge(local.snmp_client_defaults, var.snmp_client)
}