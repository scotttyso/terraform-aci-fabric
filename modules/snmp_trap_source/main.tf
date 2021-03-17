/*
SNMP Trap Source
API Information:
 - Class: "snmpSrc"
 - Distinguished Name: "uni/fabric/moncommon/snmpsrc-{Source Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
 - Admin > Monitoring Destinations > SNMP > SNMP Monitoring Destination Group
*/
resource "aci_rest" "snmp_trap_source" {
  path       = "/api/node/mo/uni/fabric/moncommon/snmpsrc-${var.snmp_source_name}.json"
  class_name = "snmpSrc"
  payload    = <<EOF
{
  "snmpSrc": {
    "attributes": {
      "annotation": "${var.annotation}",
      "dn": "uni/fabric/moncommon/snmpsrc-${var.snmp_source_name}",
      "incl": "${var.snmp_messages}",
      "name": "${var.snmp_source_name}",
      "nameAlias": "${var.name_alias}"
    },
    "children": [
      {
        "snmpRsDestGroup": {
          "attributes": {
            "tDn": "${var.dest_group_dn}",
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
