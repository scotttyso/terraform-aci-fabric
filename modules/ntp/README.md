# ntp - Terraform Module to create NTP Servers - aci_rest

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

API Information:

*-* Class: "datetimeNtpProv"
*-* Distinguished Name: "uni/fabric/time-default/ntpprov-{NTP_Server}"

GUI Location:

*-* Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
