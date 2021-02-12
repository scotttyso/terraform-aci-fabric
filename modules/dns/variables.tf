variable "dns_domain" {
  description = "Assigned FQDN and Search Domains.  Assign yes to the fqdn variable only to the FQDN.  Assign no to the rest."
  type = map(object({
    domain = string
    fqdn   = string
  }))
  default = [
    {
      domain = "example.com"
      fqdn   = "no"
    }
  ]
}

variable "dns_mgmt" {
  description = "(inb|oob).  Should the Inband or Out-of-Band be used for DNS Requests"
  type        = string
  default     = "oob"
}

variable "dns_epg" {
  description = "What EPG in the Mgmt Domain should be used"
  type        = string
  default     = "default"
}

variable "dns_server" {
  description = "Add DNS Servers for domain resolution.  You can configure a maximum of two servers.  Only one can be preferred (true|false)"
  type = object({
    server    = string
    preferred = bool
  })
  default = [
    {
      server    = "198.18.1.1"
      preferred = false
    }
  ]
}