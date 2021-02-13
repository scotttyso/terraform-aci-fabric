variable "dns_domain_default" {
  description = "Assigned FQDN and Search Domains.  Assign yes to the fqdn variable only to the FQDN.  Assign no to the rest."
  type = object({
    domain = string
    fqdn   = string
  })
  default = {
    domain = "example.com"
    fqdn   = "no"
  }
  validation {
    condition = (
      var.dns_domain_default.fqdn == "no" || var.dns_domain_default.fqdn == "yes" &&
      can(regexall("(?:\\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*", var.dns_domain_default.domain))
    )
    error_message = "Please assign a Valid DNS Domain and set the fqdn to either 'yes' or 'no'."
  }
}

variable "dns_domain" {
  description = "Top Level dns_domain variable to work around default variable merger... The real Variable holder is 'dns_domain_default'."
  default     = ""
}

variable "dns_mgmt" {
  description = "Options are 'inb' or 'oob'.  Define the Management Domain to reach the DNS Server(s)."
  type        = string
  default     = "oob"
  validation {
    condition     = (var.dns_mgmt == "inb" || var.dns_mgmt == "oob")
    error_message = "The DNS Management Domain must be 'inb' or 'oob'."
  }
}

variable "dns_epg" {
  description = "What EPG in the Management Domain should be used to reach the DNS Server(s)."
  type        = string
  default     = "default"
}

variable "dns_server_default" {
  description = "Add DNS Servers for domain resolution.  You can configure a maximum of two servers.  Only one can be preferred 'true'."
  type = object({
    preferred = bool
    server    = string
  })
  default = {
    preferred = false
    server    = "198.18.1.1"
  }
  validation {
    condition = (
      var.dns_server_default.preferred == true || var.dns_server_default.preferred == false &&
      can(regexall("^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$|^(?:(?:[0-9A-Fa-f]{1,4}:){6}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|::(?:[0-9A-Fa-f]{1,4}:){5}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){4}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){3}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,2}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){2}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,3}[0-9A-Fa-f]{1,4})?::[0-9A-Fa-f]{1,4}:(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,4}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,5}[0-9A-Fa-f]{1,4})?::[0-9A-Fa-f]{1,4}|(?:(?:[0-9A-Fa-f]{1,4}:){,6}[0-9A-Fa-f]{1,4})?::)(?:%25(?:[A-Za-z0-9\\-._~]|%[0-9A-Fa-f]{2})+)?$", var.dns_server_default.server))
    )
    error_message = "The DNS Server must be a valid IPv4 or IPv6 Address.  And preferred should be true or false."
  }
}

variable "dns_server" {
  description = "Top Level dns_domain variable to work around default variable merger... The real Variable holder is 'dns_server_default'."
  default     = ""
}

locals {
  merged_dns_domain = merge(var.dns_domain_default, var.dns_domain)
  merged_dns_server = merge(var.dns_server_default, var.dns_server)
}