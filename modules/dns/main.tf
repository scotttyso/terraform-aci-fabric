/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[{Domain}]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "dns_domain" {
  for_each   = local.dns_domain
  path       = "/api/node/mo/uni/fabric/dnsp-default/dom-[${each.value["domain"]}].json"
  class_name = "dnsDomain"
  payload    = <<EOF
{
  "dnsDomain": {
    "attributes": {
      "annotation": "${each.value["annotation"]}",
      "descr": "${each.value["description"]}",
      "dn": "uni/fabric/dnsp-default/dom-[${each.value["domain"]}]",
      "isDefault": "${each.value["fqdn"]}",
      "name": "${each.value["domain"]}",
      "nameAlias": "${each.value["name_alias"]}",
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
      "tDn": "${var.mgmt_domain_dn}"
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
  for_each   = local.dns_server
  path       = "/api/node/mo/uni/fabric/dnsp-default/prov-[${each.value["server"]}].json"
  class_name = "dnsProv"
  payload    = <<EOF
{
  "dnsProv": {
    "attributes": {
      "addr": "${each.value["server"]}",
      "annotation": "${each.value["annotation"]}",
      "dn": "uni/fabric/dnsp-default/prov-[${each.value["server"]}]",
      "nameAlias": "${each.value["name_alias"]}",
      "preferred": "${each.value["preferred"]}"
    }
  }
}
  EOF
}
