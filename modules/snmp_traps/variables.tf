variable "destination_group" {
  description = "SNMP Destination Group Configuration."
  type = object({
    # snmp_dest_group: Create the SNMP Destination Group: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group
    snmp_dest_group = string
    # dest_grp_descr: SNMP Destination Group Description.
    dest_grp_descr = string
  })
}

variable "snmp_source" {
  description = "Configuration to Create a SNMP Source."
  type = object({
    # snmp_dest_group: This should have already been created by the "destination_group" configuration.
    snmp_dest_group = string
    # snmp_source: Create a SNMP Source under Fabric > Fabric Policies > Policies > Monitoring > Common Policy > 
    #              Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
    snmp_source = string
    # snmp_messages: (none|all|audit|events|faults|session).  Best Practice; recommendation, 'audit,events,faults'.
    #                APIC default is 'all'.  Which Message Types to include with the SNMP Source.
    snmp_messages = string
  })
}

variable "snmp_traps" {
  description = "SNMP Trap Server Variables"
  type = object({
    # snmp_dest_group: This should have already been created by the "destination_group" configuration.
    snmp_dest_group = string
    # snmp_server: IPv4 or IPv6 Address for the SNMP Server
    snmp_server = string
    # snmp_port: This will typically be 162.
    snmp_port = number
    # snmp_string: snmp user or snmp community to assign to the server
    snmp_string = string
    # security_level: (noauth|auth|priv)
    #                 auth - Authentication and no privacy
    #                 noauth - No authentication and no privacy - default for v1 and v2c
    #                 priv - Authentication and privacy
    security_level = string
    # snmp_version: (v1|v2c|v3).  v3 for snmp users and v1 or v2c for communities.
    snmp_version = string
    # mgmt: Either inb or oob (inb|oob)
    mgmt = string
    # epg: EPG contained within the Management Domain Specified above.  Typically "default"
    epg = string
  })
}

locals {
  default_destination_group = {
    snmp_dest_group = "default"
    dest_grp_descr  = "SNMP Trap Destination Group - Created by Terraform Startup Script"
  }
  merged_destination_group = merge(local.default_destination_group, var.destination_group)
  default_snmp_source = {
    snmp_dest_group = "default"
    snmp_source     = "default"
    snmp_messages   = "audit,events,faults"
  }
  merged_snmp_source = merge(local.default_snmp_source, var.snmp_source)
  default_snmp_traps = {
    snmp_dest_group = "default"
    snmp_server     = "198.18.1.1"
    snmp_port       = 162
    snmp_string     = "walk-this-way"
    Security_Level  = "noauth"
    snmp_version    = "v2c"
    mgmt            = "oob"
    epg             = "default"
  }
  merged_snmp_traps = merge(local.default_snmp_traps, var.snmp_traps)
}