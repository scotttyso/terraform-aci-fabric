/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[{Domain}]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "dns_domain" {
  for_each   = var.dns_domain
  path       = "/api/node/mo/uni/fabric/dnsp-default/dom-[${var.value.domain}].json"
  class_name = "dnsDomain"
  payload    = <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[${var.value.domain}]",
            "name": "${var.value.domain}",
            "isDefault": "${var.value.fqdn}",
        },
        "children": []
    }
}
	EOF
}

/*
API Information:
 - Class: "dnsRsProfileToEpg"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{EPG}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG
*/
resource "aci_rest" "DNS_Mgmt_Domain" {
  path       = "/api/node/mo/uni/fabric/dnsp-default.json"
  class_name = "dnsRsProfileToEpg"
  payload    = <<EOF
{
    "dnsRsProfileToEpg": {
        "attributes": {
            "tDn": "uni/tn-mgmt/mgmtp-default/${var.dns_mgmt}-${var.dns_epg}"
        },
        "children": []
    }
}
	EOF
}

/*
API Information:
 - Class: "dnsProv"
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[{DNS_Server}]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "dns_server" {
  for_each   = var.dns_server
  path       = "/api/node/mo/uni/fabric/dnsp-default/prov-[${var.value.server}].json"
  class_name = "dnsProv"
  payload    = <<EOF
{
    "dnsProv": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/prov-[${var.value.server}]",
            "addr": "${var.value.server}",
            "preferred": "${var.value.preferred}",
        }
        "children": []
    }
}
	EOF
}