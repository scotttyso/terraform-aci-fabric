/*
API Information:
 - Class: "snmpTrapFwdServerP"
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[{Trap Server}]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "snmp_trap_server" {
  path       = "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[${var.snmp_server}].json"
  class_name = "snmpTrapFwdServerP"
  payload    = <<EOF
{
  "snmpTrapFwdServerP": {
    "attributes": {
      "annotation": "${var.annotation}",
      "dn": "uni/fabric/snmppol-default/trapfwdserver-[${var.snmp_server}]",
      "addr": "${var.snmp_server}",
      "nameAlias": "${var.name_alias}",
      "port": "${var.snmp_port}"
    },
    "children": []
  }
}
  EOF
}

/*
API Information:
 - Class: "snmpTrapDest"
 - Distinguished Name: "uni/fabric/snmpgroup-{SNMP Destination Group}/trapdest-{SNMP Trap Server}-port-{SNMP Port}"
GUI Location:
 - Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group: Trap Servers
*/
resource "aci_rest" "snmp_trap_destination" {
  path       = "/api/node/mo/${var.dest_group_dn}/trapdest-${var.snmp_server}-port-${var.snmp_port}.json"
  class_name = "snmpGroup"
  payload    = <<EOF
{
  "snmpTrapDest": {
    "attributes": {
      "annotation": "${var.annotation}",
      "dn": "${var.dest_group_dn}/trapdest-${var.snmp_server}-port-${var.snmp_port}",
      "host": "${var.snmp_server}",
      "port": "${var.snmp_port}",
      "secName": "${var.snmp_string}",
      "v3SecLvl": "${var.security_level}",
      "ver": "${var.snmp_version}"
    },
    "children": [
      {
        "fileRsARemoteHostToEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_dn}"
          }
        }
      }
    ]
  }
}
  EOF
}
