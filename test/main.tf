module "fabric_bgp" {
  source  = "../modules/bgp"
  bgp_asn = 65002
  bgp_rr = {
    # Because the only variable is node_id I need to configure even the default here as the loop would overwrite the default
    "spine101" = {
      node_id = "101"
    },
    "spine102" = {
      node_id = "102"
    }
  }
}

module "fabric_dns" {
  source  = "../modules/dns"
  # The default "oob" mgmt Domain is being used here so there is no need for: 
  # dns_mgmt  = "oob"
  dns_domain = {
    "dmz_domain" = {
      domain = "dmz.example.com"
      # The default setting for fqdn is "no", I can accept that without adding it here
    },
    "prod_domain" = {
      domain = "prod.example.com"
      fqdn   = "yes"
    }
  }
  dns_server = {
    "dns_server1" = {
      preferred = true
      # The default server is 198.18.1.1 so I am accepting it here.
    },
    "dns_server2" = {
      # The default setting for preferred is "false", I can accept that without adding it here
      server    = "198.18.1.2"
    }
  }
}