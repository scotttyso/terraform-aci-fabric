module "fabric_best_practices" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/best_practices"
  version = "0.0.3"
}

module "fabric_snmp_client_grp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_client_grp"
  version = "0.0.3"
}

module "fabric_snmp_clients" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_clients"
  version = "0.0.3"
}

module "fabric_snmp_community" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_community"
  version = "0.0.3"
  # insert required variables here
  community = var.secure_community1
}

module "fabric_snmp_dest_grp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_dest_grp"
  version = "0.0.3"
}

module "fabric_snmp_trap_source" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_trap_source"
  version = "0.0.3"
}

module "fabric_snmp_trap_server" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_trap_server"
  version = "0.0.3"
  # insert required variables here
  snmp_string = var.community1
}

module "fabric_snmp_user" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/snmp_user"
  version = "0.0.3"
  # insert required variables here
  snmp_user = var.snmp_user1
  auth_key  = var.auth_key1
}

module "fabric_syslog_dest_grp" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_dest_grp"
  version = "0.0.3"
}

module "fabric_syslog_source" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_source"
  version = "0.0.3"
}

module "fabric_syslog_server" {
  source  = "app.terraform.io/Cisco-ITS-TigerTeam/fabric/aci//modules/syslog_server"
  version = "0.0.3"
}