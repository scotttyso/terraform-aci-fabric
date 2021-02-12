# dns - Add DNS Servers for APIC/switch domain resolution Terraform Module - aci_rest

## Usage

```hcl
module "dns" {

  source = "terraform-aci-fabric//modules/dns"

  # omitted...
}
```

This module will Add DNS Servers for Fabric FQDN resolution.

These resources are created:

* [dns](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

FQDN and Search Domains:

* Class: "dnsDomain"
* Distinguished Name: "uni/fabric/dnsp-default/dom-[{Domain}]"

DNS Management Domain:

* Class: "dnsRsProfileToEpg"
* Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{EPG}"

DNS Server:

* Class: "dnsProv"
* Distinguished Name: "uni/fabric/dnsp-default/prov-[{DNS_Server}]"

GUI Location:

FQDN and Search Domains:

* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains

DNS Management Domain:

* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG

DNS Server:

* Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers

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
| dns\_domain | Assigned FQDN and Search Domains.  Assign yes to the fqdn variable only to the FQDN.  Assign no to the rest. | <pre>map(object({<br>    domain = string<br>    fqdn   = string<br>  }))</pre> | n/a | yes |
| dns\_epg | What EPG in the Mgmt Domain should be used. | `string` | `"default"` | no |
| dns\_mgmt | (inb\|oob).  Should the Inband or Out-of-Band be used for DNS Requests. | `string` | `"oob"` | no |
| dns\_server | Add DNS Servers for domain resolution.  You can configure a maximum of two servers.  Only one can be preferred (true\|false). | <pre>object({<br>    server    = string<br>    preferred = bool<br>  })</pre> | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->