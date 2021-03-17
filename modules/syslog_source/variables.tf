variable "annotation" {
  description = "Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another."
  type        = string
  default     = ""
}

variable "dest_group_dn" {
  description = "Syslog Destination Group Distinguished Name.  This should have already been created by the 'syslog_dest_grp' module"
  type        = string
}

variable "incl_types" {
  description = "Options are (None|all|audit|events|faults|session).  Default is faults.  We recommend 'alerts,faults,events,session' or 'all', same result."
  type        = string
  default     = "alerts,faults,events,session"
}

variable "name_alias" {
  description = "A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed."
  type        = string
  default     = ""
}

variable "min_level" {
  description = "Options are (emergencies|alerts|critical|errors|warnings|notifications|information|debugging).  Default is warnings.  Best practice is information."
  type        = string
  default     = "information"
  validation {
    condition     = (can(regexall("^(emergencies|alerts|critical|errors|warnings|notifications|information|debugging)$", var.min_level)))
    error_message = "The Syslog Source Minimum Level must be one of the following:\n (emergencies|alerts|critical|errors|warnings|notifications|information|debugging)."
  }
}

variable "source_group" {
  description = "Syslog Source Group Name.  Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source."
  type        = string
  default     = "default"
}
