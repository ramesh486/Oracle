resource oci_core_vcn this {
  cidr_block = var.vcn_cidr_block
  compartment_id = var.compartment_ocid
  defined_tags = var.definedTags
  display_name = var.vcn_display_name
  dns_label    = var.vcn_dns_label
  freeform_tags = var.freeformTags
}