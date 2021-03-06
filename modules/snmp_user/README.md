# snmp_user - SNMP User Terraform Module - aci_rest

## Usage

```hcl
module "snmp_user" {

  source = "terraform-aci-fabric//modules/snmp_user"

  # omitted...
}
```

This module will Add SNMP Users in the default SNMP Policy.

## APIC Reference Information

Use the Class or Distinguished Name to verify in the API.

* Class: "snmpUserP"
* Distinguished Name: "uni/fabric/snmppol-default/user-{SNMP_User}"
* GUI Location: Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users

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
| auth\_key | Authentication Key.  A string between 8 and 32 Characters.  This is a Sensitive Parameter. | `string` | n/a | yes |
| auth\_type | Authentication Type.  Options are [hmac-sha1-96\|None\|hmac-md5-96]<br> - For ACI 4.x and below with md5 leave Blank.<br> - For ACI 5.x do 'hmac-md5-96', which is the default option for md5 based authentication. | `string` | `"hmac-md5-96"` | no |
| name\_alias | A changeable name for a given object. While the name of an object, once created, cannot be changed, the Alias is a field that can be changed. | `string` | `""` | no |
| priv\_key | Privacy Key.  A string between 8 and 32 Characters.  Optional if not doing Privacy Authentication.  This is a Sensitive Parameter. | `string` | `""` | no |
| priv\_type | Options are (des\|None\|aes-128)<br> - For None leave Blank with ACI 4.x.  With ACI 5.x do des which is the default. | `string` | `"des"` | no |
| snmp\_user | SNMP User Name. | `string` | n/a | yes |

## Outputs

No output.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
