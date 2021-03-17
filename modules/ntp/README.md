# ntp - Terraform Module to Assign NTP Servers to ACI - aci_rest

## Usage

```hcl
module "ntp" {

  source = "terraform-aci-fabric//modules/ntp"

  # omitted...
}
```

This module will Add NTP Servers to the default Date and Time Policy.

These resources are created:

* [ntp](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "datetimeNtpProv"
* Distinguished Name: "uni/fabric/time-default/ntpprov-{NTP_Server}"
* GUI Location: Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers

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
| description | The Description for the NTP Server. | `string` | `""` | no |
| mgmt\_domain\_dn | The Distinguished Name for the Management Domain.<br> Example: "uni/tn-mgmt/mgmtp-default/oob-default" | `string` | `"uni/tn-mgmt/mgmtp-default/oob-default"` | no |
| name | Hostname or IPv4/IPv6 address of the NTP Server. | `string` | `"198.18.1.1"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| preferred | Indicates if the NTP server is preferred. Multiple preferred servers can be configured. The NTP server preference states include the following:<br>  * no — The NTP server is not preferred.<br>  * yes — The NTP server is preferred<br>The default is no. | `string` | `"no"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
