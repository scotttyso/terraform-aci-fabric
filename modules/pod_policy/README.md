# pod_policy - Pod Policy Group using ACI Rest Terraform Module

## Usage

```hcl
module "pod_policy" {

  source = "terraform-aci-fabric//modules/pod_policy"

  # omitted...
}
```

This module will deploy the Pod Policy Group and assign the Pod Policy Group to the Pod Profile - default.

These resources are created

* [Pod Policy Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "fabricPodPGrp"
* Distinguished Name: "uni/fabric/funcprof/podpgrp-{Name}"
* GUI Location: Fabric > Fabric Policies > Pods > Policy Groups: {Name}

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
| bgp\_policy | BGP Route Reflector Policy Name | `string` | `"default"` | no |
| coop\_policy | COOP Group Policy Name | `string` | `"default"` | no |
| date\_time | Date and Time Policy Name | `string` | `"default"` | no |
| description | Description for the Pod Policy Group | `string` | `"Default Policy Created by the terraform-aci provider"` | no |
| isis\_policy | ISIS Policy Name | `string` | `"default"` | no |
| macsec\_policy | MACsec Policy Name | `string` | `"default"` | no |
| mgmt\_policy | Management Access Policy Name | `string` | `"default"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| ppg\_name | Pod Policy Group Name.  This will be used to assign the following policies to the switches. | `string` | `"default"` | no |
| snmp\_policy | SNMP Policy Name | `string` | `"default"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
