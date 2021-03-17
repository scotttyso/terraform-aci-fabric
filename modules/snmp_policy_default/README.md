# snmp_community - SNMP Community Terraform Module - aci_rest

## Usage

```hcl
module "snmp_community" {

  source = "terraform-aci-fabric//modules/snmp_community"

  # omitted...
}
```

This module will Add SNMP Communities to the default SNMP Policy.

These resources are created:

* [SNMP Communities](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "snmpCommunityP"
* Distinguished Name: "uni/fabric/snmppol-default/community-{SNMP Community}"
* GUI Location: Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies

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
| community | An SNMP Community String.  The community can be between 0 and 32 characters. | `string` | n/a | yes |
| description | SNMP Community Description. | `string` | `""` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
