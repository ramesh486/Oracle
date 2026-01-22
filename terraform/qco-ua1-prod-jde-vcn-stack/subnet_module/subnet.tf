
resource oci_core_subnet this {
  cidr_block     = var.vcn_subnet_cidr_block
  compartment_id = var.compartment_ocid
  defined_tags = var.definedTags
  dhcp_options_id = var.dhcp_options_ocid
  display_name    = var.vcn_subnet_display_name
  dns_label       = var.vcn_subnet_dns_label
  freeform_tags = var.freeformTags
  prohibit_internet_ingress  = var.vcn_subnet_prohibit_internet_ingress
  prohibit_public_ip_on_vnic = var.vcn_subnet_prohibit_public_ip_on_vnic
  route_table_id             = var.route_table_ocid
  security_list_ids = [
    var.security_list_ocid,
  ]
  vcn_id = var.vcn_ocid
}
