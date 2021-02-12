variable "snmp_client_grp" {
  description = "Client Group, Mgmt Domain, and Associated EPG"
  type = object({
    name = string
    mgmt = string
    epg  = string
  })
  default = [
    {
      name = "oob_clients"
      mgmt = "oob"
      epg  = "default"
    }
  ]
}

variable "snmp_client" {
  description = "Associate a SNMP Client to a Client Group (AKA Management SNMP Access Control)"
  type = object({
    client_grp = string
    client     = string
    mgmt       = string
    epg        = string
  })
  default = [
    {
      client_grp = "oob_clients"
      client     = "198.18.1.1"
      mgmt       = "oob"
      epg        = "default"
    }
  ]
}