

locals {

  cidr_blocks_type = {
    cidr_block         = "CIDR_BLOCK"
    service_cidr_block = "SERVICE_CIDR_BLOCK"
  }
  compartment_ocid               = data.oci_identity_compartments.this.compartments[0].id
  drg_ocid                       = data.oci_core_drgs.this.drgs[0].id
  prod_compartment_ocid          = data.oci_identity_compartments.prod_compartment.compartments[0].id
  spoke_vcn_drg_route_table_ocid = data.oci_core_drg_route_tables.this.drg_route_tables[0].id
  routing_through_drg_and_lpg    = var.route_to_exadata_vcn_using_drg == true ? local.drg_ocid : module.vcn_nprd_jde_vcn_to_exadata_vcn_lpg_attachment.lpg_attachment_ocid
  peering_lpg_ocid               = length(data.oci_core_local_peering_gateways.this.local_peering_gateways) == 0 ? null : data.oci_core_local_peering_gateways.this.local_peering_gateways[0].id
  peering_prod_hub_lpg_ocid      = length(data.oci_core_local_peering_gateways.prod_hub_lpg.local_peering_gateways) == 0 ? null : data.oci_core_local_peering_gateways.prod_hub_lpg.local_peering_gateways[0].id
  security_list_protocols = {
    ALL_PROTOCOLS     = "all"
    ICMP              = "1"
    TCP               = "6"
    UDP               = "17"
    ICMPv6            = "58"
    icmp_options_type = "3"
    icmp_options_code = "4"
  }

  cidr_blocks = {
    any_ip_range                                = "0.0.0.0/0"
    all_iad_services_in_oracle_services_network = data.oci_core_services.this.services.1.cidr_block
  }

  security_list_ports = {
    ssh   = "22"
    https = "443"
  }
}
