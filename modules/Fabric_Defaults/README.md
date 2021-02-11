# aci_rest - ACI Rest Terraform Module

## Usage

```hcl
module "Fabric_Defaults" {

  source = "terraform-cisco-modules/terraform-aci/modules/Fabric_Defaults"

  # omitted...
}
```

This module will deploy the recommended Fabric characteristics for the Fabric Policy Configuration.

These resources are created

* [SNMP Client Group - Inband](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Client Group - Out-of-Band](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Client Pool](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [SNMP Client Pool](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.5 |
| intersight | =1.0.0 |

## Providers

| Name | Version |
|------|---------|
| intersight | =1.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| gateway | Default gateway for this pool. | `string` | n/a | yes |
| name | Name of the IP Pool to be created. | `string` | n/a | yes |
| netmask | Subnet Mask for this pool. | `string` | n/a | yes |
| org\_name | Intersight Organization name | `string` | n/a | yes |
| pool\_size | Number of IPs you want this pool to contain. | `string` | n/a | yes |
| primary\_dns | Primary DNS Server for this pool. | `string` | n/a | yes |
| secondary\_dns | Secondary DNS Server for this pool. | `string` | n/a | yes |
| starting\_address | Starting IP Address you want for this pool. | `string` | n/a | yes |
| tags | n/a | `list(map(string))` | `[]` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->