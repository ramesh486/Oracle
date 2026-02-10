output "vcn_ocid" {
    value = oci_core_vcn.this.id
}

output "default_dhcp_options_ocid" {
    value = oci_core_vcn.this.default_dhcp_options_id
}