# snmp_client_grp - SNMP Client Groups Terraform Module - aci_rest

## Usage

```hcl
module "snmp_client_grp" {

  source = "terraform-aci-fabric//modules/snmp_client_grp"

  # omitted...
}
```

This module will Create a SNMP Client Group in the default SNMP Policy.

These resources are created:

* [SNMP Client Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

* Class: "snmpClientGrpP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"

GUI Location:

SNMP Client Group:

* Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies

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
| snmp\_client | Map of settings to be be merged with the snmp\_client\_defaults. Allowed keys are the same as for defaults. | `any` | n/a | yes |
| snmp\_client\_defaults | Associate a SNMP Client to a Client Group (AKA Management SNMP Access Control). | <pre>object({<br>    client     = string<br>    client_grp = string<br>    epg        = string<br>    mgmt       = string<br>  })</pre> | <pre>{<br>  "client": "198.18.1.1",<br>  "client_grp": "default_oob",<br>  "epg": "default",<br>  "mgmt": "oob"<br>}</pre> | no |
| snmp\_client\_grp | Map of settings to be be merged with the snmp\_client\_grp\_defaults. Allowed keys are the same as for defaults. | `any` | n/a | yes |
| snmp\_client\_grp\_defaults | Client Group, Mgmt Domain, and Associated EPG. | <pre>object({<br>    epg  = string<br>    mgmt = string<br>    name = string<br>  })</pre> | <pre>{<br>  "epg": "default",<br>  "mgmt": "oob",<br>  "name": "default_oob"<br>}</pre> | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->