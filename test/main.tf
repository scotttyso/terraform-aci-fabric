#
# *** FABRIC BEST PRACTICES ***
#

module "fabric_best_practices" {
  source = "../modules/best_practices"
  # The Values below (besides descriptions) are based on Cisco's Best Practices.  But these settings are not default out of the box.
  # ** All of the settings below are the defaults.  To change a default value uncomment the line. **
  # "fabric_mgmt_preference"  = "ooband"
  # "fabric_coop_policy"      = "strict"
  # "fabric_node_dom"         = 1
  # "fabric_dom_descr"        = "Enable Digital Optical Monitoring with 1 to Monitor optical interface statistics"
  # "fabric_node_feature"     = "telemetry"
  # "fabric_isis_metric"      = 63
  # "fabric_bfd"              = "enabled"
  # "fabric_bfd_descr"        = "Fabric BFD Policy"
  # "domain_validation"       = true
  # "subnet_check"            = true
  # "disable_remote_ep_learn" = true
  # "ep_loop_state"           = "enabled"
  # "ep_loop_action"          = ""
  # "rouge_state"             = "enabled"
  # "rouge_interval"          = 30
  # "rouge_multiplier"        = 6
  # "ip_aging_state"          = "enabled"
  # "port_tracking"           = "on"
  # "mcp_description"         = "Configured using Terraform ACI Provider Deployment Script"
  # "mcp_control"             = "pdu-per-vlan"
  # "mcp_state"               = "enabled"
  # "mcp_key"                 = "cisco"
  # "preserve_cos"            = "dot1p-preserve"
}

#
# *** BGP CONFIGURATION ***
#

module "fabric_bgp" {
  source  = "../modules/bgp"
  bgp_asn = 65000
  bgp_rr = {
    # Because the only variable is node_id I need to configure even the default here as the loop would overwrite the default.
    "spine101" = {
      node_id = "101"
    },
    # "spine102" = {
    #   node_id = "102"
    # }
  }
}

#
# *** DNS CONFIGURATION ***
#

module "fabric_dns" {
  source = "../modules/dns"
  # mgmt_domain_dn  = var.oob_mgmt_domain # The default EPG in OOB is the default management Distinguished Name.
  dns_domain = {
    "dmz_domain" = {
      description = "This is a DNS Search Domain for the DMZ zone."
      domain      = "dmz.example.com"
      # preferrred  "no"  # The default setting for fqdn is "no", I can accept that without adding it here.
    },
    "prod_domain" = {
      description = "This is the FQDN DNS Domain."
      domain      = "example.com"
      fqdn        = "yes"
    }
  }
  dns_server = {
    "dns_server1" = {
      preferred = "yes"
      # server    = "198.18.1.1"  # The default server is 198.18.1.1.
    },
    "dns_server2" = {
      # preferred = "no" # The default setting for preferred is "no".
      server = "198.18.1.2"
    }
  }
}

#
# *** NTP CONFIGURATION ***
#

module "fabric_ntp_server1" {
  source         = "../modules/ntp"
  description    = "1st NTP Server"
  mgmt_domain_dn = var.oob_mgmt_domain
  # name            = "198.18.1.1"  # The default server is 198.18.1.1 so I am accepting it here.
  preferred = "yes"
}

module "fabric_ntp_server2" {
  source      = "../modules/ntp"
  description = "2nd NTP Server"
  # mgmt_domain_dn  = var.oob_mgmt_domain # Above it showed using the variable but since it is the default I don't have to define it.
  name = "198.18.1.2"
  # preferred       = "no"  # As "no" is the default I don't have to define here.
}

#
# *** CREATE A POD POLICY ***
#

module "fabric_pod_policy" {
  source = "../modules/pod_policy"
  # A Pod Policy is not created by default out of box but is needed for routing exchange.
  # ** All of the settings below are the defaults.  To change a default value uncomment the line. **
  # "ppg_name"      = "default"  # Pod Policy Group (ppg) Name
  # "annotation"    = ""
  # "bgp_policy"    = "default"
  # "coop_policy"   = "default"
  # "date_time"     = "default"
  # "description"   = "Default Policy Created by the terraform-aci provider"
  # "isis_policy"   = "default"
  # "macsec_policy" = "default"
  # "mgmt_policy"   = "default"
  # "name_alias"    = ""
  # "snmp_policy"   = "default"
}

#
# *** SMART CALLHOME CONFIGURATION ***
#

module "fabric_smart_callhome_dest" {
  source = "../modules/smart_callhome_dest"
  # ** All of the settings below are the defaults.  To change a default value uncomment the line. **
  # mgmt_domain_dn  = var.oob_mgmt_domain       # Using the Default Management Distinguished Name.
  # admin_state     = "enabled"                 # Using the default value.
  # contact_info    = "admins@example.com"      # Using the default value.
  # contract_id     = "55555555"                # Using the default value.
  # customer_id     = "55555555"                # Using the default value.
  description     = "Default Smart CallHome Destination Group"
  # dest_group_name = "default"                 # Using the default value.
  # email_from      = "admins@example.com"      # Using the default value.
  # email_reply     = "admins@example.com"      # Using the default value.
  # email_to        = "admins@example.com"      # Using the default value.
  # phone_number    = "+1 555-555-5555"         # Using the default value.
  # receiver        = "default"                 # Using the default value.
  # street_addr     = "One Cisco Way, San Jose, CA 90210" # Using the default value.
  # site_id         = "55555555"                # Using the default value.
  # smtp_server     = "smtp-relay.example.com"  # Using the default value.
  # smtp_port       = 25                        # Using the Default smtp_port of 25.
}

output "fabric_smart_callhome_dest" {
  value = module.fabric_smart_callhome_dest
}

module "fabric_smart_callhome_source" {
  depends_on  = [module.fabric_smart_callhome_dest]
  source      = "../modules/smart_callhome_source"
  # insert required variables here
  dest_group_dn   = module.fabric_smart_callhome_dest.smart_callhome_dest
}

#
# *** SNMP CONFIGURATION ***
#

module "fabric_snmp_client_grp" {
  source = "../modules/snmp_client_grp"
  # ** All of the settings below are the defaults.  To change a default value uncomment the line. **
  # client_group    = "default_oob"       # Using the default value.
  description = "Default SNMP Client Group for Out-of-Band"
  # mgmt_domain_dn  = var.oob_mgmt_domain # Using the Default Management Distinguished Name.
}

output "fabric_snmp_client_grp" {
  value = module.fabric_snmp_client_grp
}

module "fabric_snmp_client1" {
  depends_on = [module.fabric_snmp_client_grp]
  source     = "../modules/snmp_clients"
  # insert required variables here
  client_group_dn = module.fabric_snmp_client_grp.snmp_client_grp
  # name            = "server1"
  # client          = "198.18.1.1"
}

module "fabric_snmp_client2" {
  depends_on = [module.fabric_snmp_client_grp]
  source     = "../modules/snmp_clients"
  # insert required variables here
  client_group_dn = module.fabric_snmp_client_grp.snmp_client_grp
  name            = "server2"
  client          = "198.18.1.2"
}

module "fabric_snmp_community1" {
  source = "../modules/snmp_community"
  # insert required variables here
  community   = var.community1
  description = "1st SNMP Community"
}

module "fabric_snmp_community2" {
  source = "../modules/snmp_community"
  # insert required variables here
  community   = var.community2
  description = "2nd SNMP Community"
}

module "fabric_snmp_dest_grp" {
  source      = "../modules/snmp_dest_grp"
  description = "This will be the Default SNMP Destination Group"
  # dest_group_name = "default" # Using the default value.
}

output "fabric_snmp_dest_grp" {
  value = module.fabric_snmp_dest_grp
}

module "fabric_snmp_trap_source" {
  depends_on = [module.fabric_snmp_dest_grp]
  source     = "../modules/snmp_trap_source"
  # insert required variables here
  dest_group_dn = module.fabric_snmp_dest_grp.snmp_dest_grp
  # snmp_messages     = "audit,events,faults"     # Using the default value.
  # snmp_source_name  = "default_oob"             # Using the default value.
}

module "fabric_snmp_trap_server1" {
  depends_on = [module.fabric_snmp_dest_grp]
  source     = "../modules/snmp_trap_server"
  # insert required variables here
  dest_group_dn = module.fabric_snmp_dest_grp.snmp_dest_grp
  # mgmt_domain_dn  = var.oob_mgmt_domain # Using the Default Management Distinguished Name.
  # security_level  = "noauth"            # Using the default value.
  # snmp_port       = 162                 # Using the default value.
  # snmp_server     = "198.18.1.1"        # Using the default value.
  snmp_string = var.community1
  # snmp_version    = "v2c"               # Using the default value.
}

module "fabric_snmp_trap_server2" {
  depends_on = [module.fabric_snmp_dest_grp]
  source     = "../modules/snmp_trap_server"
  # insert required variables here
  dest_group_dn = module.fabric_snmp_dest_grp.snmp_dest_grp
  # mgmt_domain_dn  = var.oob_mgmt_domain # Using the Default Management Distinguished Name.
  # security_level  = "noauth"            # Using the default value.
  # snmp_port       = 162                 # Using the default value.
  snmp_server  = "198.18.1.2"
  snmp_string  = var.snmp_user2
  snmp_version = "v3"
}

module "fabric_snmp_user1" {
  source = "../modules/snmp_user"
  # insert required variables here
  auth_key = var.auth_key1
  # auth_type = "hmac-md5-96"  # Using the default value.
  # priv_type = "des"          # Using the default value.
  snmp_user = var.snmp_user1
}

module "fabric_snmp_user2" {
  source = "../modules/snmp_user"
  # insert required variables here
  auth_key  = var.auth_key2
  auth_type = "hmac-sha1-96"
  priv_key  = var.priv_key2
  priv_type = "aes-128"
  snmp_user = var.snmp_user2
}

#
# *** SYSLOG CONFIGURATION ***
#

module "fabric_syslog_dest_grp" {
  source = "../modules/syslog_dest_grp"
  # console_sev     = "critical"    # Using the default value.
  # console_state   = "enabled"     # Using the default value.
  description = "This will be the Default Syslog Destination Group"
  # dest_group_name = "default"     # Destination Group Name.
  # incl_msec       = true          # Using the default value.
  # log_format      = "aci"         # Using the default value.
  # local_sev       = "information" # Using the default value.
  # local_state     = "enabled"     # Using the default value.
  # timezone        = true          # Using the default value.
}

output "fabric_syslog_dest_grp" {
  value = module.fabric_syslog_dest_grp
}

module "fabric_syslog_source" {
  depends_on = [module.fabric_syslog_dest_grp]
  source     = "../modules/syslog_source"
  # insert required variables here
  dest_group_dn = module.fabric_syslog_dest_grp.syslog_dest_grp
  # incl_types      = "alerts,faults,events,session"  # Using the default value.
  # min_level       = "information"                   # Using the default value.
  # source_group    = "default"                       # Name of the Syslog Source Group.
}

module "fabric_syslog_server1" {
  depends_on = [module.fabric_syslog_dest_grp]
  source     = "../modules/syslog_server"
  # insert required variables here
  dest_group_dn = module.fabric_syslog_dest_grp.syslog_dest_grp
  # facility        = "local7"            # Using the default value.
  # mgmt_domain_dn  = var.oob_mgmt_domain # Using the Default Management Distinguished Name.
  # syslog_name     = "server1"           # Using the default value.
  # syslog_port     = 514                 # Using the default value.
  # syslog_server   = "198.18.1.1"        # Using the default value.
  # syslog_severity = "information"       # Using the default value.
}

module "fabric_syslog_server2" {
  depends_on = [module.fabric_syslog_dest_grp]
  source     = "../modules/syslog_server"
  # insert required variables here
  dest_group_dn = module.fabric_syslog_dest_grp.syslog_dest_grp
  # facility        = "local7"            # Using the default value.
  # mgmt_domain_dn  = var.oob_mgmt_domain # Using the Default Management Distinguished Name.
  syslog_name = "server2"
  # syslog_port     = 514                 # Using the default value.
  syslog_server = "198.18.1.2"
  # syslog_severity = "information"       # Using the default value.
}
