variable "mgmt_preference" {
	description	= "Prefer Inband or Out-of-Band for Mgmt (inband|ooband).  default is inband. Majority of customers set to ooband, thus the default value."
	type		= string
	default 	= "ooband" 
}

variable "coop_policy" {
	description	= "(strict|compatible).  Best Practice is strict.  COOP protocol is enhanced to support two ZMQ authentication modes:  Compatible Type—COOP accepts both MD5 authenticated and non-authenticated ZMQ connections for message transportation. Note:  The APIC provides a managed object (fabric:SecurityToken), that includes an attribute to be used for the MD5 password. An attribute in this managed object, called 'token', is a string that changes every hour. COOP obtains the notification from the DME to update the password for ZMQ authentication. The attribute token value is not displayed.  Strict Type—COOP allows MD5 authenticated ZMQ connections only."
	type		= string
	default 	= "strict" 
}

variable "dom" {
	description	= "Digital Optical Monitoring (DOM) for an optical physical interface.  0 is disabled.  1 is enabled. We recommend 1"
	type		= number
	default 	= 1
}

variable "dom_descr" {
	description	= "Description for Digital Optical Monitoring"
	type		= string
	default 	= "Enable Digital Optical Monitoring with 1 to Monitor optical interface statistics" 
}

variable "isis_metric" {
	description	= "The ISIS Redistribuation Metric can be between 1 and 63.. We recommend the other default policies remain as configured"
	type		= number
	default 	= 63 
}

variable "fabric_bfd" {
	description	= "Setting to Enable or Disable BFD for the Fabric Interfaces.  Default is 'disabled'... Best Practice is 'enabled'"
	type		= string
	default 	= "enabled" 
}

variable "coop_policy" {
	description	= "Recommended Coop Policy Control"
	type		= string
	default 	= "strict" 
}

variable "coop_policy" {
	description	= "Recommended Coop Policy Control"
	type		= string
	default 	= "strict" 
}

variable "coop_policy" {
	description	= "Recommended Coop Policy Control"
	type		= string
	default 	= "strict" 
}

variable "coop_policy" {
	description	= "Recommended Coop Policy Control"
	type		= string
	default 	= "strict" 
}

variable "SNMP_ClientGrp" {
	description = "Client Group, Mgmt Domain, and Associated EPG"
	type	= map(object({
		name	= string
		mgmt	= string
		epg		= string
	}))
	default = [
	  {
		name	= "oob_clients"
		mgmt	= "oob"
		epg		= "default"
	  }
	]
}

variable "snmp_client" {
	description = "Associate a SNMP Client to a Client Group (AKA Management SNMP Access Control)"
	type 	= map(object({
		client_grp	= string
		client		= string
		mgmt		= string
		epg			= string
	}))
	default = [
	  {
		client_grp	= "oob_clients"
		client		= "198.18.1.1"
		mgmt		= "oob"
		epg			= "default"
	  }
	]
}