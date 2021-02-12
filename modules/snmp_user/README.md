# snmp_clients - SNMP Clients Terraform Module - aci_rest

## Usage

```hcl
module "snmp_clients" {

  source = "terraform-aci-fabric//modules/snmp_clients"

  # omitted...
}
```

This module will Add SNMP Clients to a SNMP Client Group in the default SNMP Policy.

These resources are created:

* [SNMP Client Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Clients](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

SNMP Client Group:

* Class: "snmpClientGrpP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"

SNMP Clients:

* Class: "snmpClientP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}/client-[SNMP_Client]"

GUI Location:

SNMP Client Group:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies

SNMP Clients:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: {Client Group Name} > Client Entries

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | > 0.14 |
| aci | >= 0.5.2 |

## Providers

| Name | Version |
|------|---------|
| aci | >= 0.5.2 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aci_rest](https://registry.terraform.io/providers/ciscodevnet/aci/0.5.2/docs/resources/rest) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| snmp\_users | SNMP User Defination. | <pre>object({<br>    snmp_user = string<br>    priv_type = optional(string)<br>    priv_key  = optional(string)<br>    auth_type = optional(string)<br>    auth_key  = string<br>  })</pre> | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->