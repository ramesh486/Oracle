resource oci_core_internet_gateway this {
  compartment_id = var.compartment_ocid
  defined_tags = var.definedTags
  display_name = var.intgw_display_name
  enabled      = var.intgw_enabled
  freeform_tags = var.freeformTags
  vcn_id = var.vcn_ocid
}