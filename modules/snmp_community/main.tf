/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-{SNMP Community}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "snmp_community" {
  path       = "/api/node/mo/uni/fabric/snmppol-default/community-${var.community}.json"
  class_name = "snmpCommunityP"
  payload    = <<EOF
{
  "snmpCommunityP": {
    "attributes": {
      "annotation": "${var.annotation}",
      "descr": "${var.description}",
      "dn": "uni/fabric/snmppol-default/community-${var.community}",
      "name": "${var.community}",
      "nameAlias": "${var.name_alias}"
    },
    "children": []
  }
}
  EOF
}
