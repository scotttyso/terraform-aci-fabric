# bgp - BGP Configuration Terraform Module - aci_rest

## Usage

```hcl
module "bgp" {

  source = "terraform-aci-fabric//modules/bgp"

  # omitted...
}
```

This module will Configure the BGP ASN and add the Route Reflectors for the ACI Fabric.

These resources are created:

* [BGP ASN](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)
* [BGP Route Reflectors](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

BGP Autonomous System Number:
*-* Class: "bgpAsP"
*-* Distinguished Name: "uni/fabric/bgpInstP-default"

BGP Route Reflectors:
*-* Class: "bgpRRNodePEp"
*-* Distinguished Name: "uni/fabric/bgpInstP-default/rr/node-{Node ID}"

GUI Location:

BGP Autonomous System Number:
*-* System > System Settings > BGP Route Reflector: Autonomous System Number

BGP Route Reflectors:
*-* System > System Settings > BGP Route Reflector: Route Reflector Nodes
