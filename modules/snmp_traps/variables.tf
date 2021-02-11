variable "snmp_src" {
	description = "Create a SNMP Source under Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP"
	type 	= string
	default = "default"
}

variable "messages" {
	description = "Which Message Types to include with the SNMP Source"
	type 	= string
	default = "audits,events,faults"
}

variable "dest_grp" {
	description = "Create the SNMP Destination Group: Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group"
	type 	= string
	default = "default"
}