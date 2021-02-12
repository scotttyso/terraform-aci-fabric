# snmp_community - SNMP Community Terraform Module - aci_rest

## Usage

```hcl
module "snmp_community" {

  source = "terraform-aci-fabric/modules//snmp_community"

  # omitted...
}
```

This module will Add SNMP Communities to the default SNMP Policy.

These resources are created:

* [SNMP Communities](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:
*-* Class: "snmpCommunityP"
*-* Distinguished Name: "uni/fabric/snmppol-default/community-{SNMP Community}"

GUI Location:
*-* Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
