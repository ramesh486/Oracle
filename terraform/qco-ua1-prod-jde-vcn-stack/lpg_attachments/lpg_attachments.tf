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
    peer_id = var.peering_lpg_ocid
    route_table_id = var.attach_vcn_route_table_to_lpg == true ? var.vcn_lpg_route_table_ocid : ""
}