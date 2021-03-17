# snmp_client_grp - SNMP Client Group Terraform Module - aci_rest

## Usage

```hcl
module "snmp_client_grp" {

  source = "terraform-aci-fabric//modules/snmp_client_grp"

  # omitted...
}
```

This module will Create a SNMP Client Group in the default SNMP Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "snmpClientGrpP"
* Distinguished Name: "uni/fabric/snmppol-default/clgrp-{Client Group Name}"
* GUI Location: Fabric > Fabric Policies > Policies > Pod > SNMP > default - Client Group Policies

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
| annotation | Annotation is a Tag.  Tags define the label parameters and enables the classifying of the objects that can and cannot communicate with one another. | `string` | `""` | no |
| client\_group | SNMP Client Group Name | `string` | `"default_oob"` | no |
| description | SNMP Client Group Description. | `string` | `""` | no |
| mgmt\_domain\_dn | The Distinguished Name for the Management Domain.<br> Example: "uni/tn-mgmt/mgmtp-default/oob-default" | `string` | `"uni/tn-mgmt/mgmtp-default/oob-default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| snmp\_client\_grp | This output will provide the Distinguished Name of the SNMP Client Group. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
