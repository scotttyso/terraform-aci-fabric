/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-{SNMP Community}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "snmp_communities" {
  for_each   = var.communities
  path       = "/api/node/mo/uni/fabric/snmppol-default/community-${var.value.community}.json"
  class_name = "snmpCommunityP"
  payload    = <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/community-${var.value.community}",
            "descr": "${var.value.community_descr}",
            "name": "${var.value.comm_name}"
        },
        "children": []
    }
}
	EOF
}