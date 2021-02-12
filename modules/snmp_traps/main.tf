/*
API Information:
 - Class: "snmpGroup"
 - Distinguished Name: "uni/fabric/snmpgroup-{SNMP Trap Destination Group}"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > SNMP > {SNMP Trap Destination Group}
*/
resource "aci_rest" "snmp_trap_destination_group" {
  for_each   = var.destination_group
  path       = "/api/node/mo/uni/fabric/snmpgroup-${var.value.snmp_dest_group}.json"
  class_name = "snmpGroup"
  payload    = <<EOF
{
    "snmpGroup": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-${var.value.snmp_dest_group}",
            "descr": "${var.value.dest_grp_descr}",
            "name": "${var.value.snmp_dest_group}"
        },
        "children": []
    }
}
	EOF
}

/*
SNMP Trap Source
API Information:
 - Class: "snmpSrc"
 - Distinguished Name: "uni/fabric/moncommon/snmpsrc-{Source Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
 - Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group
*/
resource "aci_rest" "snmp_trap_src" {
  path       = "/api/node/mo/uni/fabric/moncommon/snmpsrc-${var.snmp_source}.json"
  class_name = "snmpSrc"
  payload    = <<EOF
{
	"snmpSrc": {
		"attributes": {
			"dn": "uni/fabric/moncommon/snmpsrc-${var.snmp_source}",
			"incl": "${var.snmp_messages}",
			"name": "${var.snmp_source}",
		},
		"children": [
			{
				"snmpRsDestGroup": {
					"attributes": {
						"tDn": "uni/fabric/snmpgroup-${var.snmp_dest_grp}",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

/*
API Information:
 - Class: "snmpTrapFwdServerP"
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[{Trap Server}]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "snmp_trap_server" {
  for_each   = var.snmp_traps
  path       = "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[${var.value.snmp_server}].json"
  class_name = "snmpTrapFwdServerP"
  payload    = <<EOF
{
    "snmpTrapFwdServerP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/trapfwdserver-[${var.value.snmp_server}]",
            "addr": "${var.value.snmp_server}",
            "port": "${var.value.snmp_port}"
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
  for_each   = var.snmp_traps
  path       = "/api/node/mo/uni/fabric/snmpgroup-${var.value.snmp_dest_group}/trapdest-${var.value.snmp_server}-port-${var.value.snmp_port}.json"
  class_name = "snmpGroup"
  payload    = <<EOF
{
	"snmpTrapDest": {
		"attributes": {
			"dn": "uni/fabric/snmpgroup-${var.value.snmp_dest_group}/trapdest-${var.value.snmp_server}-port-${var.value.snmp_port}",
			"host": "${var.value.snmp_server}",
			"port": "${var.value.snmp_port}",
			"secName": "${var.value.snmp_string}",
			"v3SecLvl": "${var.value.security_level}",
			"ver": "${var.value.snmp_version}"
		},
		"children": [
			{
				"fileRsARemoteHostToEpg": {
					"attributes": {
						"tDn": "uni/tn-mgmt/mgmtp-default/${each.value.mgmt}-${each.value.epg}"
					}
				}
			}
		]
	}
}
	EOF
}