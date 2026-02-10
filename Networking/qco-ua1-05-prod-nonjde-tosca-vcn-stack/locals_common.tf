locals {
    common_route_rules_for_all_subnets = [
        {
            destination       = var.onprem_route
            network_entity_id = module.vcn_nonjde_to_prod_hub_lpg_attachment.lpg_attachment_ocid
            destination_type  = "CIDR_BLOCK"
        },
        {
            destination       = var.prd_hub_vcn_cidr_block
            network_entity_id = module.vcn_nonjde_to_prod_hub_lpg_attachment.lpg_attachment_ocid
            destination_type  = "CIDR_BLOCK"
        },
        {
            destination       = local.cidr_blocks.all_iad_services_in_oracle_services_network
            network_entity_id = module.vcn_nonjde_servicegateway_private.service_gateway_ocid
            destination_type  = "SERVICE_CIDR_BLOCK"
        },
    ]
}