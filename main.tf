terraform {
    required_version = "~> 1.0.3"
    required_providers {
        intersight = {
            source = "CiscoDevNet/intersight"
            version = "1.0.13"
        }
    }
}

provider "intersight" {
    apikey = var.api_key
    secretkey = var.secretkey
    endpoint = var.endpoint
}

data "intersight_organization_organization" "default" {
    name = "default"
}
# print default org moid
output "org_default_moid" {
    value = data.intersight_organization_organization.default.moid
}

module "intersight_policy_bundle" {
  source = "terraform-cisco-modules/policy-bundle/intersight"

  # external sources
  organization    = data.intersight_organization_organization.default.id
  vnic_mac_pool   = var.mac_pool_moid
  imc_access_pool = var.ip_pool_moid

  # every policy created will have this prefix in its name
  policy_prefix = "ott04"
  description   = "Created by Terraform"

  # Fabric Interconnect 6454 config specifics
  server_ports_6454 = [1, 2, 3, 4]
  port_channel_6454 = [49, 50]
  uplink_vlans_6454 = {
    "vlan1" : 1,
    "vlan50" : 50,
    "vlan51" : 51,
    "vlan52" : 52,
    "vlan53" : 53,
    "vlan54" : 54,
    "vlan55" : 55,
    "vlan3091" : 3091
  }

  fc_port_count_6454 = 0

  imc_access_vlan    = 50
  imc_admin_password = "C!sco123"

  ntp_servers = ["ca.pool.ntp.org"]

  dns_preferred = "10.101.0.251"
  dns_alternate = "10.101.0.251"

  ntp_timezone = "America/Toronto"

    tags = [
    { "key" : "location", "value" : "OTT04" },
    { "key" : "orchestrator", "value" : "terraform" }
  ]
}
