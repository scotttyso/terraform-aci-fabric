/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-{NTP_Server}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "ntp" {
    for_each    = var.ntp
	path		= "/api/node/mo/uni/fabric/time-default/ntpprov-${var.value.ntp_server}.json"
	class_name	= "datetimeNtpProv"
	payload		= <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "dn": "uni/fabric/time-default/ntpprov-${var.value.ntp_server}",
            "name": "${var.value.ntp_server}",
            "preferred": "${var.value.preferred}",
            "rn": "ntpprov-${var.value.ntp_server}"
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "uni/tn-mgmt/mgmtp-default/${var.value.mgmt}-${var.value.epg}"
                    }
                }
            }
        ]
    }
}
	EOF
}