variable "fabric_mgmt_preference" {
  description = "(inband|ooband).  Prefer Inband or Out-of-Band for routing Mgmt traffic.  default is inband. Majority of customers set to ooband, thus the default value."
  type        = string
  default     = "ooband"
}

variable "fabric_coop_policy" {
  description = "(strict|compatible).  Best Practice is strict.  APIC default is compatible.  COOP protocol is enhanced to support two ZMQ authentication modes:  Compatible Type—COOP accepts both MD5 authenticated and non-authenticated ZMQ connections for message transportation. Note:  The APIC provides a managed object (fabric:SecurityToken), that includes an attribute to be used for the MD5 password. An attribute in this managed object, called 'token', is a string that changes every hour. COOP obtains the notification from the DME to update the password for ZMQ authentication. The attribute token value is not displayed.  Strict Type—COOP allows MD5 authenticated ZMQ connections only."
  type        = string
  default     = "strict"
}

variable "fabric_node_dom" {
  description = "(enabled [1]| disabled [0]).  Best Practice is 1.  APIC default is 0.  Digital Optical Monitoring (DOM) for an optical physical interface."
  type        = number
  default     = 1
}

variable "fabric_dom_descr" {
  description = "Description for Digital Optical Monitoring"
  type        = string
  default     = "Enable Digital Optical Monitoring with 1 to Monitor optical interface statistics"
}

variable "fabric_node_feature" {
  description = "(analytics|netflow|telemetry). Best Practice is telemetry.  APIC default is telemetry.  This will set which engine will be enabled on the switches for sending information.  Telemetry is what is required by all the day 2 operaitons tools for Streaming Telemetry.  Analytics is for Tetration analytics"
  type        = string
  default     = "telemetry"
}

variable "fabric_isis_metric" {
  description = "Best Practice is 63.  The ISIS Redistribuation Metric can be between 1 and 63.  We recommend the other default policies remain as configured"
  type        = number
  default     = 63
}

variable "fabric_bfd" {
  description = "(enabled|disabled). Best Practice is enabled.  APIC default disabled.  This setting will configure BFD for the Fabric Interfaces."
  type        = string
  default     = "enabled"
}

variable "fabric_bfd_descr" {
  description = "Description for the Fabric BFD Policy"
  type        = string
  default     = "Fabric BFD Policy"
}

variable "domain_validation" {
  description = "(true|false).  Best Practice true.  APIC default false.  Validation check if a static path is added but no domain is associated to an EPG"
  type        = string
  default     = "true"
}

variable "subnet_check" {
  description = "(true|false).  Best Practice true.  APIC default false.  To Restrict IP address learning the the configured subnets in a VRF, for all VRFs"
  type        = string
  default     = "true"
}

variable "disable_remote_ep_learn" {
  description = "To disable remote endpoint learning in VRFs containing external bridged/routed domains"
  type        = string
  default     = "true"
}

variable "ep_loop_state" {
  description = "Enable or Disable, (enabled|disabled), endpoint loop protection state.  The endpoint loop protection policy specifies how loops detected by frequent MAC moves are handled"
  type        = string
  default     = "enabled"
}

variable "ep_loop_action" {
  description = "(port-disable|bd-learn-disable).  To enable both use 'port-disable,bd-learn-disable'.  Best practice is to have no actions AKA ''.  APIC default is 'port-disable'.  on can be:  BD Learn Disable or Port Disable."
  type        = string
  default     = ""
}

variable "rouge_state" {
  description = "(enabled|disabled).  Best Practice enabled.  APIC default is disabled.  A rogue endpoint can attack top of rack (ToR) switches through frequently, repeatedly injecting packets on different ToR ports and changing 802.1Q tags (emulating endpoint moves), resulting in learned sclass and EPG port changes. Misconfigurations can also cause frequent IP and MAC addresss changes (moves)"
  type        = string
  default     = "enabled"
}

variable "rouge_interval" {
  description = "Best Practice is 30.  APIC default is 60.  Sets the Rogue EP detection interval, which specifies the time to detect rogue endpoints. Valid values are from 0 to 65535 seconds."
  type        = string
  default     = 30
}

variable "rouge_multiplier" {
  description = "Best Practice is 6.  APIC default is 4.  Sets the Rogue EP Detection multiplication factor for determining if an endpoint is unauthorized. If the endpoint moves more times than this number, within the EP detection interval, the endpoint is declared rogue. Valid values are from 2 to 10."
  type        = number
  default     = 6
}

variable "ip_aging_state" {
  description = "(enabled|disabled).  Best Practice enabled.  APIC default is disabled.  When enabled, the IP aging policy ages unused IPs on an endpoint."
  type        = string
  default     = "enabled"
}

variable "port_tracking" {
  description = "(on|off).  Best Practice on.  APIC default is off.  The port tracking policy monitors the status of links between leaf switches and spine switches. When an enabled port tracking policy is triggered, the leaf switches take down all access interfaces on the switch that have EPGs deployed on them."
  type        = string
  default     = "enabled"
}

variable "mcp_description" {
  description = "Description for the MCP Instance Policy default"
  type        = string
  default     = "Configured using Terraform ACI Provider Deployment Script"
}

variable "mcp_control" {
  description = "(pdu-per-vlan|none).  Best Practice pdu-per-vlan.  APIC default is none ''.  MCP per VLAN will send the message frames on each VLAN."
  type        = string
  default     = "pdu-per-vlan"
}

variable "mcp_state" {
  description = "(enabled|disabled).  Best Practice enabled.  APIC default is disabled.  The administrative state of the MCP instance policy."
  type        = string
  default     = "enabled"
}

variable "mcp_key" {
  description = "The key or password to uniquely identify the MCP packets within this fabric."
  type        = string
  default     = "cisco"
}

variable "preserve_cos" {
  description = "(dot1p-preserve|none).  Best Practice is 'dot1p-preserve'.  APIC default is none, ''.  enable or disable CoS Preservation, to guarantee the QoS priority settings of the various traffic streams, in a single-pod topology. In multipod topologies, use a DSCP policy to enable preserving QoS priority mapping for the traffic streams as they transit the inter-pod network."
  type        = string
  default     = "dot1p-preserve"
}

