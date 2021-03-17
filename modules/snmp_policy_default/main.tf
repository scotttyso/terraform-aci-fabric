/*
API Information:
 - Class: "snmpPol"
 - Distinguished Name: "uni/fabric/snmppol-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Contact/Location
*/
resource "aci_rest" "snmp_policy_default" {
  path       = "/api/node/mo/uni/fabric/snmppol-default.json"
  class_name = "snmpPol"
  payload    = <<EOF
{
    "snmpPol": {
        "attributes": {
            "adminSt": "${var.admin_state}",
            "annotation": "${var.annotation}",
            "contact": "${var.snmp_contact}",
            "descr": "${var.description}This is the default SNMP Policy",
            "dn": "uni/fabric/snmppol-default",
            "loc": "${var.snmp_location}",
            "nameAlias": "${var.name_alias}",
        },
        "children": []
    }
}
	EOF
}
