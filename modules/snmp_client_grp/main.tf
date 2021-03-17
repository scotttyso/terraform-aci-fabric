/*
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies
*/
resource "aci_rest" "snmp_client_group" {
  path       = "/api/node/mo/uni/fabric/snmppol-default/clgrp-${var.client_group}.json"
  class_name = "snmpClientGrpP"
  payload    = <<EOF
{
  "snmpClientGrpP": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/fabric/snmppol-default/clgrp-${var.client_group}",
      "name": "${var.client_group}",
      "nameAlias": "${var.name_alias}"
    },
    "children": [
      {
        "snmpRsEpg": {
          "attributes": {
            "tDn": "${var.mgmt_domain_dn}",
          },
          "children": []
        }
      }
    ]
  }
}
  EOF
}
