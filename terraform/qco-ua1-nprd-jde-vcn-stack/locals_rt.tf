
locals {
  common_route_rules_for_all_subnets = [
    {
      destination       = var.onprem_route
      network_entity_id = local.drg_ocid
      destination_type  = "CIDR_BLOCK"
    },
    {
      destination       = var.prd_hub_vcn_cidr_block
      network_entity_id = local.drg_ocid
      destination_type  = "CIDR_BLOCK"
    },
    {
      destination       = var.prod_jde_exadata_vcn_cidr_block
      network_entity_id = local.routing_through_drg_and_lpg
      destination_type  = "CIDR_BLOCK"
    },
    {
      destination       = local.cidr_blocks.all_iad_services_in_oracle_services_network
      network_entity_id = module.vcn_nprd_servicegateway_private.service_gateway_ocid
      destination_type  = "SERVICE_CIDR_BLOCK"
    },
  ]
  route_table_rules = {
    lb = {
      sb = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      ps = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      tr = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      dv = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      qa = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      py = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
    }
    web = {
      sb = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      ps = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      tr = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      dv = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      qa = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      py = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
    }

    app = {
      sb = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      ps = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      tr = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      dv = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      qa = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
      py = flatten([
        local.common_route_rules_for_all_subnets
        # Add specific route rules if required
      ])
    }
  }



  nprd_vcn_jde_ldap_routetable_route_rules = flatten([
    local.common_route_rules_for_all_subnets
    # Add specific route rules if required
  ])
}
