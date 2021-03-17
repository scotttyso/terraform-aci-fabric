variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "dest_group_dn" {
  description = "Syslog Destination Group Distinguished Name.  This should have already been created by the 'syslog_dest_grp' module."
  type        = string
}

variable "facility" {
  description = "Options are (local[0-7]).  Default is local7."
  type        = string
  default     = "local7"
  validation {
    condition     = (can(regexall("^local[0-7]$", var.facility)))
    error_message = "The Syslog Facilty must be one of the following:\n (local[0-7])."
  }
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

variable "syslog_name" {
  description = "A Descriptive Name for the Syslog Remote Destination."
  type        = string
  default     = "server1"
}

variable "syslog_port" {
  description = "Default port for Syslog is 514."
  type        = number
  default     = 514
  validation {
    condition = (
      var.syslog_port >= 1 &&
      var.syslog_port <= 65535
    )
    error_message = "The Syslog Port must be between 1 and 65535."
  }
}

variable "syslog_server" {
  description = "IPv4 or IPv6 Address for the Syslog Remote Server."
  type        = string
  default     = "198.18.1.1"
  validation {
    condition     = (can(regexall("(^(\\d{1,3}\\.\\d{1,3}\\.\\d{1,3}\\.\\d{1,3})$|^(?:(?:[0-9A-Fa-f]{1,4}:){6}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|::(?:[0-9A-Fa-f]{1,4}:){5}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){4}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){3}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,2}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:){2}(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,3}[0-9A-Fa-f]{1,4})?::[0-9A-Fa-f]{1,4}:(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,4}[0-9A-Fa-f]{1,4})?::(?:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}|(?:(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\\.){3}(?:[0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))|(?:(?:[0-9A-Fa-f]{1,4}:){,5}[0-9A-Fa-f]{1,4})?::[0-9A-Fa-f]{1,4}|(?:(?:[0-9A-Fa-f]{1,4}:){,6}[0-9A-Fa-f]{1,4})?::)(?:%25(?:[A-Za-z0-9\\-._~]|%[0-9A-Fa-f]{2})+)?$)", var.syslog_server)))
    error_message = "The Syslog Server must be a valid IPv4 or IPv6 Address."
  }
}

variable "syslog_severity" {
  description = "Options are (emergencies|alerts|critical|errors|warnings|notifications|information|debugging).  Default is warnings.  Best practice is information."
  type        = string
  default     = "information"
  validation {
    condition     = (can(regexall("^(emergencies|alerts|critical|errors|warnings|notifications|information|debugging)$", var.syslog_severity)))
    error_message = "The Syslog Severity must be one of the following:\n (emergencies|alerts|critical|errors|warnings|notifications|information|debugging)."
  }
}
