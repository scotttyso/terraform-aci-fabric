/*
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies
*/
resource "aci_rest" "SNMP_Client_Group" {
	for_each   	= var.SNMP_ClientGrp
	path       	= "/api/node/mo/uni/fabric/snmppol-default/clgrp-${each.value.name}.json"
	class_name 	= "snmpClientGrpP"
	payload    	= <<EOF
{
	"snmpClientGrpP": {
		"attributes": {
			"dn": "uni/fabric/snmppol-default/clgrp-${each.value.name}",
			"name": "${each.value.name}",
			"descr": "SNMP Clients allowed on Mgmt ${each.value.mgmt} EPG ${each.value.epg}",
			"status": "created"
		},
		"children": [
			{
				"snmpRsEpg": {
					"attributes": {
						"tDn": "uni/tn-mgmt/mgmtp-default/${each.value.mgmt}-${each.value.epg}",
						"status": "created"
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
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries
*/
resource "aci_rest" "snmp_client" {
	depends_on  = [aci_rest.SNMP_Client_Group]
	for_each   	= var.snmp_client
	path		= "/api/node/mo/uni/fabric/snmppol-default/clgrp-${each.value.client_grp}_Clients/client-[${each.value.client}].json"
	class_name	= "snmpClientP"
	payload		= <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-${each.value.client_grp}/client-[${each.value.client}]",
            "name": "${each.key}",
            "addr": "${each.value.client}",
        },
        "children": []
    }
}
	EOF
}