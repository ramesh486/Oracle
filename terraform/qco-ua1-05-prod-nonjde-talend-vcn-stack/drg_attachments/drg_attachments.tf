# --------------------------------------------------------
# DRG Attachments
# --------------------------------------------------------
resource oci_core_drg_attachment this {
  defined_tags       = var.definedTags
  display_name       = var.oci_core_drg_attachment_display_name
  drg_id             = var.drg_ocid
  drg_route_table_id = var.drg_route_table_ocid
  freeform_tags = var.freeformTags
  network_details {
    id = var.vcn_ocid
    type           = local.network_details_type
  }
}