locals {
    common_route_rules_for_all_subnets = [
        {
            destination       = local.cidr_blocks.all_iad_services_in_oracle_services_network
            network_entity_id = module.vcn_prod_nonjde_servicegateway_private.service_gateway_ocid
            destination_type  = "SERVICE_CIDR_BLOCK"
        },
    ]
}