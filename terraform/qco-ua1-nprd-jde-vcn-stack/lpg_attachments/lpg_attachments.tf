# --------------------------------------------------------
# LPG Attachments
# --------------------------------------------------------

resource "oci_core_local_peering_gateway" "this" {
    #Required
    compartment_id = var.compartment_ocid
    vcn_id = var.vcn_ocid

    #Optional
    defined_tags = var.definedTags
    display_name = var.local_peering_gateway_display_name
    freeform_tags = var.freeformTags
    peer_id = var.initiate_lpg_peering == false ? null : var.lpg_peering_ocid
    route_table_id = var.attach_routetable_to_lpg == false ? null : var.lpg_route_table_ocid
}