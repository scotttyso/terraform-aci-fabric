variable "snmp_client_grp" {
  description = "Client Group, Mgmt Domain, and Associated EPG."
  type = object({
    name = string # default: 'default_oob'
    mgmt = string # default: 'oob'
    epg  = string # default: 'default'
  })
  default = {
    name = "default_oob"
    mgmt = "oob"
    epg  = "default"
  }
}

variable "snmp_client" {
  description = "Associate a SNMP Client to a Client Group (AKA Management SNMP Access Control)."
  type = object({
    client_grp = string # default: 'default_oob'
    client     = string # default: '198.18.1.1'
    mgmt       = string # default: 'oob'
    epg        = string # default: 'default'
  })
}

locals {
  default_snmp_client_grp = {
    name = "default_oob"
    mgmt = "oob"
    epg  = "default"
  }
  merged_snmp_client_grp = merge(local.default_snmp_client_grp, var.snmp_client_grp)
  default_snmp_client = {
    client_grp = "default_oob"
    client     = "198.18.1.1"
    mgmt       = "oob"
    epg        = "default"
  }
  merged_snmp_client = merge(local.default_snmp_client, var.snmp_client)
}