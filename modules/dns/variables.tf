terraform {
  experiments = [module_variable_optional_attrs]
}

variable "dns_domain" {
  description = "Assigned FQDN and Search Domains.  Assign yes to the fqdn variable only to the domain that will be used for the FQDN.  Assign no to the rest."
  type = map(object({
    annotation  = optional(string)
    description = optional(string)
    domain      = optional(string)
    fqdn        = optional(string)
    name_alias  = optional(string)

  }))
  default = {
    default = {
      annotation  = ""
      description = ""
      domain      = "example.com"
      fqdn        = "no"
      name_alias  = ""
    }
  }
  #  validation {
  #    condition = (
  #      var.dns_domain_default.fqdn == "no" || var.dns_domain_default.fqdn == "yes" &&
  #      can(regexall("(?:\\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*", var.dns_domain_default.domain))
  #    )
  #    error_message = "Please assign a Valid DNS Domain and set the fqdn to either 'yes' or 'no'."
  #  }
}

variable "dns_server" {
  description = "Add DNS Servers for domain resolution.  You can configure a maximum of two servers.  Only one can be preferred 'true'."
  type = map(object({
    annotation = optional(string)
    preferred  = optional(string)
    server     = optional(string)
    name_alias = optional(string)
  }))
  default = {
    default = {
      annotation = ""
      preferred  = "no"
      server     = "198.18.1.1"
      name_alias = ""
    }
  }
  #  validation {
  #    condition = (
  #      var.dns_server["preferred"] == true || var.dns_server["preferred"] == false &&
  #      can(regexall("^\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$", var.dns_server["server"]))
  #    )
  #    error_message = "The DNS Server must be a valid IPv4 Address.  And preferred should be true or false."
  #  }
}

variable "mgmt_domain_dn" {
  description = "The Distinguished Name for the Management Domain.\n Example: \"uni/tn-mgmt/mgmtp-default/oob-default\""
  type        = string
  default     = "uni/tn-mgmt/mgmtp-default/oob-default"
}

locals {
  dns_domain = {
    for k, v in var.dns_domain : k => {
      annotation  = (v.annotation != null ? v.annotation : "")
      description = (v.description != null ? v.description : "")
      domain      = coalesce(v.domain, "example.com")
      fqdn        = coalesce(v.fqdn, "no")
      name_alias  = (v.name_alias != null ? v.name_alias : "")
    }
  }
  dns_server = {
    for k, v in var.dns_server : k => {
      annotation = (v.annotation != null ? v.annotation : "")
      preferred  = coalesce(v.preferred, "no")
      server     = coalesce(v.server, "198.18.1.1")
      name_alias = (v.name_alias != null ? v.name_alias : "")
    }
  }
}
