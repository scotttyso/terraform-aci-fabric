variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "dest_group_dn" {
  description = "SNMP Trap Destination Group Distinguished Name.  This should have already been created by the 'snmp_dest_grp' module"
  type        = string
}

variable "mgmt_domain_dn" {
  description = "The Distinguished Name for the Management Domain.\n Example: \"uni/tn-mgmt/mgmtp-default/oob-default\""
  type        = string
  default     = "uni/tn-mgmt/mgmtp-default/oob-default"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "security_level" {
  description = "Options are (auth|noauth|priv)\n - auth: Authentication and no privacy\n - noauth: Default.  No authentication and no privacy.\n - priv: Authentication and privacy"
  type        = string
  default     = "noauth"
  validation {
    condition     = (can(regexall("^(auth|noauth|priv)$", var.security_level)))
    error_message = "SNMP Trap Security Level options are (auth|noauth|priv)."
  }
}

variable "snmp_port" {
  description = "Port for the SNMP Trap Server.  Default is 162"
  type        = number
  default     = 162
  validation {
    condition = (
      var.snmp_port >= 1 &&
      var.snmp_port <= 65535
    )
    error_message = "The SNMP TRAP Server Port must be between 1 and 65535."
  }
}

variable "snmp_server" {
  description = "IPv4 or IPv6 Address of the SNMP Trap Server"
  type        = string
  default     = "198.18.1.1"
  #  validation {
  #    condition     = (can(regexall("^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}$|^(?:(?:[0-9A-Fa-f]{1,4}:){6}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|::(?:[0-9A-Fa-f]{1,4}:){5}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){4}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){3}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,2}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){2}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,3}[0-9A-Fa-f]{1,4})?::[0-9A-Fa-f]{1,4}:(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,4}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,5}[0-9A-Fa-f]{1,4})?::[0-9A-Fa-f]{1,4}|(?:(?:[0-9A-Fa-f]{1,4}:){,6}[0-9A-Fa-f]{1,4})?::)(?:%25(?:[A-Za-z0-9\\-._~]|%[0-9A-Fa-f]{2})+)?$", var.snmp_server)))
  #    error_message = "The SNMP Server must be a valid IPv4 or IPv6 Address."
  #  }
}

variable "snmp_string" {
  description = "SNMP User or SNMP Community for authenticating to the SNMP Trap Server.  This is a Sensitive Parameter."
  type        = string
  sensitive   = true
  validation {
    condition = (
      length(var.snmp_string) >= 1 &&
      length(var.snmp_string) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.snmp_string))
    )
    error_message = "The SNMP Trap Server user or community is a Required Parameter and must be between 1 and 32 characters.  This is a Sensitive Parameter."
  }
}

variable "snmp_version" {
  description = "Options are (v1|v2c|v3).  Version 3 would be for SNMP User"
  type        = string
  default     = "v2c"
  validation {
    condition     = (can(regexall("^(v1|v2c|v3)$", var.snmp_version)))
    error_message = "SNMP Trap Version options are (v1|v2c|v3)."
  }
}
