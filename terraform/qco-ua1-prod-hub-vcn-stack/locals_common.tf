locals {
    common_route_rules_for_all_subnets = [
        {
        "destination"       = var.onprem_route
        "network_entity_id" = local.drg_ocid
        "destination_type"  = "CIDR_BLOCK"
        },
        {
        "destination"       = var.prod_jde_vcn_cidr_block
        "network_entity_id" = module.vcn_prod_hub_vcn_to_prod_jde_vcn_lpg_attachment.lpg_attachment_ocid
        "destination_type"  = "CIDR_BLOCK"
        },
        {
        "destination"       = var.nprd_jde_vcn_cidr_block
        "network_entity_id" = module.vcn_prod_hub_vcn_to_nprd_jde_vcn_lpg_attachment.lpg_attachment_ocid
        "destination_type"  = "CIDR_BLOCK"
        },
        {
        "destination"       = var.prod_exadata_jde_vcn_cidr_block
        "network_entity_id" = module.vcn_prod_hub_vcn_to_exadata_jde_vcn_lpg_attachment.lpg_attachment_ocid
        "destination_type"  = "CIDR_BLOCK"
        },
        {
        "destination"       = var.prod_nonjde_vcn_cidr_block
        "network_entity_id" = module.vcn_prod_hub_vcn_to_prod_nonjde_vcn_lpg_attachment.lpg_attachment_ocid
        "destination_type"  = "CIDR_BLOCK"
        },
        {
        "destination"       = var.nprd_nonjde_vcn_cidr_block
        "network_entity_id" = module.vcn_prod_hub_vcn_to_nprd_nonjde_vcn_lpg_attachment.lpg_attachment_ocid
        "destination_type"  = "CIDR_BLOCK"
        },
    ]
}