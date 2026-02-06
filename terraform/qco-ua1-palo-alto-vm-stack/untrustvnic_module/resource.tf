resource "oci_core_vnic_attachment" "untrust_vnic" {
  instance_id = module.paloaltovm_module.instance_id
  display_name = var.untrust_vnic_display_name
  
  create_vnic_details {
    subnet_id = var.untrst_subnet_ocid
    assign_public_ip = var.assign_public_ip_secondary
	skip_source_dest_check = var.skip_source_dest_check
    assign_private_dns_record = var.assign_private_dns_record_secondary
  }
  nic_index = var.untrust_nic_index
}