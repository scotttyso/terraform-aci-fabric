variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "console_sev" {
  description = "Options are (emergencies|alerts|critical).  Set the console logging level."
  type        = string
  default     = "critical"
  validation {
    condition     = (can(regexall("^(emergencies|alerts|critical)$", var.console_sev)))
    error_message = "The Console Severity must be one of the following:\n (emergencies|alerts|critical)."
  }
}

variable "console_state" {
  description = "Options are (enabled|disabled).  Enable or disable console logging on the switches."
  type        = string
  default     = "enabled"
  validation {
    condition     = (var.console_state == "enabled" || var.console_state == "disabled")
    error_message = "Syslog Console State Options are (enabled|disabled)."
  }
}

variable "description" {
  description = "Syslog Destination Group Description."
  type        = string
  default     = ""
  validation {
    condition = (
      length(var.description) >= 0 &&
      length(var.description) <= 128 &&
      can(regexall("[a-zA-Z0-9\\!#$%()*,-./:;@ _{|}~?&+]+", var.description))
    )
    error_message = "The Syslog Destination Group Description can be between 0 ad 128 characters."
  }
}

variable "dest_group_name" {
  description = "Create the Syslog Destination Group: External Data Collectors > Monitoring Destinations > Syslog > {Destination Group Name}."
  type        = string
  default     = "default_oob"
}

variable "incl_msec" {
  description = "Options are (true|false).  Include msec in the log timestamp."
  type        = bool
  default     = true
  validation {
    condition     = (var.incl_msec == true || var.incl_msec == false)
    error_message = "Include Millisecond options are (true|false)."
  }
}

variable "log_format" {
  description = "Options are (aci|nxos).  Default is aci.  Choose whether you want the logs to be sent in NX-OS format or ACI Format."
  type        = string
  default     = "aci"
  validation {
    condition     = (var.log_format == "aci" || var.log_format == "nxos")
    error_message = "Syslog Log Format options are (aci|nxos)."
  }
}

variable "local_sev" {
  description = "Options are (emergencies|alerts|critical|errors|warnings|notifications|information|debugging).  Set the local logging level."
  type        = string
  default     = "information"
  validation {
    condition     = (can(regexall("^(emergencies|alerts|critical|errors|warnings|notifications|information|debugging)$", var.local_sev)))
    error_message = "The Local Severity must be one of the following:\n (emergencies|alerts|critical|errors|warnings|notifications|information|debugging)."
  }
}

variable "local_state" {
  description = "Options are [enabled|disabled].  Enable or disable console logging on the switches."
  type        = string
  default     = "enabled"
  validation {
    condition     = (var.local_state == "enabled" || var.local_state == "disabled")
    error_message = "Syslog Local State Options are (enabled|disabled)."
  }
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "timezone" {
  description = "Options are (true|false).  Include the local time zone in the log timestamp."
  type        = bool
  default     = true
  validation {
    condition     = (var.timezone == true || var.timezone == false)
    error_message = "Timezone options are (true|false)."
  }
}
