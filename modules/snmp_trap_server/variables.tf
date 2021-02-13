variable "dest_group" {
  description = "SNMP Trap Destination Group Name.  This should have already been created by the 'snmp_dest_grp' module"
  type        = string
  default     = "default_oob"
}

variable "snmp_server" {
  description = "IPv4 or IPv6 Address of the SNMP Trap Server"
  type        = string
  validation {
    condition = ( can(regexall("^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}|[a-fA-F0-9:]+$", var.syslog_server)))
    error_message = "The SNMP Server must be a valid IPv4 or IPv6 Address."
  }
}

variable "snmp_port" {
  description = "Port for the SNMP Trap Server.  Default is 162"
  type        = number
  default     = 162
  validation {
    condition = (
      length(var.syslog_port) >= 1 &&
      length(var.syslog_port) <= 65535
    )
    error_message = "The SNMP TRAP Server Port must be between 1 and 65535"
  }
}

variable "snmp_string" {
  description = "SNMP User or SNMP Community for authenticating to the SNMP Trap Server."
  type        = string
  sensitive   = true
  validation {
    condition = (
      length(var.snmp_user) >= 1 &&
      length(var.snmp_user) <= 32 &&
      can(regexall("^([a-zA-Z0-9\\-\\_\\.]+)$", var.snmp_user))
    )
    error_message = "The SNMP Trap Server user or community is a Required Parameter and must be between 1 and 32 characters."
  }
}

variable "security_level" {
  description = "Options are (auth|noauth|priv)\n - auth: Authentication and no privacy\n - noauth: Default.  No authentication and no privacy.\n - priv: Authentication and privacy"
  type        = string
  default     = "noauth"
  validation {
    condition = (can(regexall("^(auth|noauth|priv)$", var.security_level)))
    error_message = "SNMP Trap Security Level options are (auth|noauth|priv)."
  }
}

variable "snmp_version" {
  description = "Options are (v1|v2c|v3).  Version 3 would be for SNMP User"
  type        = string
  default     = "v2c"
  validation {
    condition = (can(regexall("^(v1|v2c|v3)$", var.security_level)))
    error_message = "SNMP Trap Version options are (v1|v2c|v3)."
  }
}

variable "mgmt" {
  description = "Options are 'inb' or 'oob'.  Define the Management Domain to reach this SNMP Trap Server"
  type        = string
  default     = "oob"
  validation {
    condition = ( var.epg == "inb" || var.epg == "oob" )
    error_message = "The SNMP Trap Server Management Domain must be 'inb' or 'oob'."
  }
}

variable "epg" {
  description = "Define EPG within the Management Domain to reach this SNMP Trap Server"
  type        = string
  default     = "default"
}