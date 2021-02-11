# snmp_clients - SNMP Clients Terraform Module - aci_rest

## Usage

```hcl
module "snmp_clients" {

  source = "terraform-aci-fabric/modules/snmp_clients"

  # omitted...
}
```

This module will Add SNMP Clients to a SNMP Client Group in the default SNMP Policy.

These resources are created:

* [SNMP Client Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Clients](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

SNMP Client Group:
*-* Class: "snmpClientGrpP"
*-* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"

SNMP Clients:
*-* Class: "snmpClientP"
*-* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"

GUI Location:

SNMP Client Group:
*-* Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies

SNMP Clients:
*-* Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries