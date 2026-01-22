
resource oci_core_route_table this {
  compartment_id = var.compartment_ocid
  defined_tags = var.definedTags
  display_name = var.route_table_display_name
  freeform_tags = var.freeformTags
  vcn_id = var.vcn_ocid
}
