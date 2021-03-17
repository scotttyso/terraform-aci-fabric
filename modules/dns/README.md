# dns - Add DNS Domains and Servers for APIC/switch domain resolution Terraform Module - aci_rest

## Usage

```hcl
module "dns" {

  source = "terraform-aci-fabric//modules/dns"

  # omitted...
}
```

This module will Add Search domains and the FQDN, then add DNS Servers for Fabric FQDN resolution.

These resources are created:

* [dns](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

**FQDN and Search Domains:**

* Class: "dnsDomain"
* Distinguished Name: "uni/fabric/dnsp-default/dom-[{Domain}]"
* GUI Location: Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains

**DNS Management Domain:**

* Class: "dnsRsProfileToEpg"
* Distinguished Name: "uni/tn-mgmt/mgmtp-default/{Mgmt_Domain}-{EPG}"
* GUI Location: Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG

**DNS Server:**

* Class: "dnsProv"
* Distinguished Name: "uni/fabric/dnsp-default/prov-[{DNS_Server}]"
* GUI Location: Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers

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
| dns\_domain | Assigned FQDN and Search Domains.  Assign yes to the fqdn variable only to the domain that will be used for the FQDN.  Assign no to the rest. | <pre>map(object({<br>    annotation  = optional(string)<br>    description = optional(string)<br>    domain      = optional(string)<br>    fqdn        = optional(string)<br>    name_alias  = optional(string)<br><br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "description": "",<br>    "domain": "example.com",<br>    "fqdn": "no",<br>    "name_alias": ""<br>  }<br>}</pre> | no |
| dns\_server | Add DNS Servers for domain resolution.  You can configure a maximum of two servers.  Only one can be preferred 'true'. | <pre>map(object({<br>    annotation = optional(string)<br>    preferred  = optional(string)<br>    server     = optional(string)<br>    name_alias = optional(string)<br>  }))</pre> | <pre>{<br>  "default": {<br>    "annotation": "",<br>    "name_alias": "",<br>    "preferred": "no",<br>    "server": "198.18.1.1"<br>  }<br>}</pre> | no |
| mgmt\_domain\_dn | The Distinguished Name for the Management Domain.<br> Example: "uni/tn-mgmt/mgmtp-default/oob-default" | `string` | `"uni/tn-mgmt/mgmtp-default/oob-default"` | no |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
