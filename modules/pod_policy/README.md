# pod_policy - Pod Policy Group using ACI Rest Terraform Module

## Usage

```hcl
module "pod_policy" {

  source = "terraform-aci-fabric/modules/pod_policy"

  # omitted...
}
```

This module will deploy the Pod Policy Group and assign the Pod Policy Group to the Pod Profile - default.

These resources are created

* [Pod Policy Group](https://registry.terraform.io/providers/CiscoDevNet/aci/latest/docs/resources/rest)

API Information:

*-* Class: "fabricPodPGrp"
*-* Distinguished Name: "uni/fabric/funcprof/podpgrp-{Name}"

GUI Location:

*-* Fabric > Fabric Policies > Pods > Policy Groups: {Name}
