resource "oci_core_public_ip" "this" {
    compartment_id = var.compartment_ocid
    lifetime = var.public_ip_lifetime
}

resource oci_core_nat_gateway this {
  block_traffic  = var.natgw_block_traffic
  compartment_id = var.compartment_ocid
  defined_tags = var.definedTags
  display_name = var.natgw_display_name
  freeform_tags = var.freeformTags
  public_ip_id = oci_core_public_ip.this.id
  vcn_id = var.vcn_ocid
}