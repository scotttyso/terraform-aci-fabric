variable "dest_group" {
  description = "Syslog Destination Group Name.  This should have already been created by the 'syslog_dest_grp' module"
  type        = string
  default     = "default_oob"
}

variable "syslog_name" {
  description = "A Descriptive Name for the Syslog Remote Destination"
  type        = string
  default     = "default_oob"
}

variable "syslog_server" {
  description = "IPv4 or IPv6 Address for the Syslog Remote Server"
  type        = string
  default     = "198.18.1.1"
  validation {
    condition = ( can(regexall("^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}|[a-fA-F0-9:]+$", var.syslog_server)))
    error_message = "The Syslog Server must be a valid IPv4 or IPv6 Address."
  }
}

variable "syslog_port" {
  description = "Default port for Syslog is 514"
  type        = number
  default     = 514
  validation {
    condition = (
      length(var.syslog_port) >= 1 &&
      length(var.syslog_port) <= 65535
    )
    error_message = "The Syslog Port must be between 1 and 65535"
  }
}

variable "facility" {
  description = "Options are (local[0-7]).  Default is local7"
  type        = string
  default     = "local7"
  validation {
    condition = ( can(regexall("^local[0-7]$", var.syslog_severity)))
    error_message = "The Syslog Facilty must be one of the following:\n (local[0-7])."
  }
}

variable "syslog_severity" {
  description = "Options are (emergencies|alerts|critical|errors|warnings|notifications|information|debugging).  Default is warnings.  Best practice is information."
  type        = string
  default     = "information"
  validation {
    condition = ( can(regexall("^(emergencies|alerts|critical|errors|warnings|notifications|information|debugging)$", var.syslog_severity)))
    error_message = "The Syslog Severity must be one of the following:\n (emergencies|alerts|critical|errors|warnings|notifications|information|debugging)."
  }
}

variable "mgmt" {
  description = "Options are 'inb' or 'oob'.  Define the Management Domain to reach this Remote Syslog Server"
  type        = string
  default     = "oob"
  validation {
    condition = ( var.epg == "inb" || var.epg == "oob" )
    error_message = "The Syslog Server Management Domain must be 'inb' or 'oob'."
  }
}

variable "epg" {
  description = "Define EPG within the Management Domain to reach this Remote Syslog Server"
  type        = string
  default     = "default"
}