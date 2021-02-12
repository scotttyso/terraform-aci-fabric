/*
API Information:
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-{SNMP_User}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "snmp_users" {
  for_each   = var.snmp_users
  path       = "/api/node/mo/uni/fabric/snmppol-default/user-${var.value.snmp_user}.json"
  class_name = "snmpUserP"
  payload    = <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-${var.value.snmp_user}",
            "name": "${var.value.snmp_user}",
            "privType": "${var.value.priv_type}",
            "privKey": "${var.value.priv_key}",
            "authType": "${var.value.auth_type}",
            "authKey": "${var.value.auth_key}"
        },
        "children": []
    }
}
	EOF
}