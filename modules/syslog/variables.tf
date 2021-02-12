terraform {
  experiments = [module_variable_optional_attrs]
}

variable "syslog" {
  description = "Syslog Destination and Source Groups"
  type = object({
    # community: SNMP Community value
    dest_group    = string
    description   = optional(string)
    log_format    = string
    incl_msec     = bool
    timezone      = bool
    console_state = string
    console_sev   = string
    local_state   = string
    local_sev     = string
    source_grp    = string
    incl_types    = string
    min_level     = string
  })
  validation {
    condition = (
      length(var.syslog.description) >= 0 &&
      length(var.syslog.description) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.syslog.description))
    )
    error_message = "The Description can only be between 0 ad 128 characters."
  }
}

variable "syslog_servers" {
  description = "Syslog Remote Servers"
  type = object({
    # community: SNMP Community value
    dest_group      = string
    syslog_name     = string
    syslog_server   = string
    syslog_port     = number
    syslog_severity = string
    facility        = string
    mgmt            = string
    epg             = string
  })
}

locals {
  default_syslog = {
    dest_group    = "default"
    log_format    = "aci"
    incl_msec     = true
    timezone      = true
    console_state = "enabled"
    console_sev   = "critical"
    local_state   = "enabled"
    local_sev     = "information"
    source_grp    = "default"
    incl_types    = "all,audit,events,faults,session"
    min_level     = "information"
  }
  merged_syslog = merge(local.default_syslog, var.syslog)
  default_syslog_servers = {
    dest_group      = "default"
    syslog_name     = "default"
    syslog_server   = "198.18.1.1"
    syslog_port     = number
    syslog_severity = "information"
    facility        = "local7"
    mgmt            = "oob"
    epg             = "default"
  }
  merged_syslog_servers = merge(local.default_syslog_servers, var.syslog)
}