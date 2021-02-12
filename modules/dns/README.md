# dns - Add DNS Servers for APIC/switch domain resolution Terraform Module - aci_rest

## Usage

```hcl
module "dns" {

  source = "terraform-aci-fabric//modules/dns"

  # omitted...
}
```

This module will Add DNS Servers for Fabric FQDN resolution.

These resources are created:

* [dns](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

FQDN and Search Domains:
*-* Class: "dnsDomain"
*-* Distinguished Name: "uni/fabric/dnsp-default/dom-[{Domain}]"

DNS Management Domain:
*-* Class: "dnsRsProfileToEpg"
*-* Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{EPG}"

DNS Server:
*-* Class: "dnsProv"
*-* Distinguished Name: "uni/fabric/dnsp-default/prov-[{DNS_Server}]"

GUI Location:

FQDN and Search Domains:
*-* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains

DNS Management Domain:
*-* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG

DNS Server:
*-* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
