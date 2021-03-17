/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries
*/
resource "aci_rest" "snmp_client" {
  path       = "/api/node/mo/${var.client_group_dn}/client-[${var.client}].json"
  class_name = "snmpClientP"
  payload    = <<EOF
{
  "snmpClientP": {
    "attributes": {
      "addr": "${var.client}",
      "annotation": "${var.annotation}",
      "dn": "${var.client_group_dn}/client-[${var.client}]",
      "name": "${var.name}",
      "nameAlias": "${var.name_alias}"
    },
    "children": []
  }
}
  EOF
}
