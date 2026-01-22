locals {

  cidr_blocks_type = {
    cidr_block         = "CIDR_BLOCK"
    service_cidr_block = "SERVICE_CIDR_BLOCK"
  }
  compartment_ocid                  = data.oci_identity_compartments.this.compartments[0].id
  drg_ocid                          = data.oci_core_drgs.this.drgs[0].id
  spoke_vcn_drg_route_table_ocid    = data.oci_core_drg_route_tables.this.drg_route_tables[0].id
  routing_through_drg_and_lpg       = var.route_to_exadata_vcn_using_drg == true ? local.drg_ocid : module.vcn_prod_jde_to_prod_exadata_lpg_attachment.lpg_attachment_ocid
  peering_prod_hub_lpg_ocid         = length(data.oci_core_local_peering_gateways.prod_hub_lpg.local_peering_gateways) == 0 ? null : data.oci_core_local_peering_gateways.prod_hub_lpg.local_peering_gateways[0].id
  peering_prod_exadata_vcn_lpg_ocid = length(data.oci_core_local_peering_gateways.prod_exadata_lpg.local_peering_gateways) == 0 ? null : data.oci_core_local_peering_gateways.prod_exadata_lpg.local_peering_gateways[0].id

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

  vcn_prod_jde_ua1_lb_routetable_private_route_rules = flatten([
    local.common_route_rules_for_all_subnets,
    #Your Specific Route Rules Here
    [
      {
        "destination"       = local.cidr_blocks.any_ip_range
        "network_entity_id" = local.drg_ocid
        "destination_type"  = "CIDR_BLOCK"
      }
    ]
  ])

  vcn_prod_jde_ua1_web_routetable_private_route_rules = flatten([
    local.common_route_rules_for_all_subnets,
    #Your Specific Route Rules Here
    [
    ]
  ])

  vcn_prod_jde_ua1_app_routetable_private_route_rules = flatten([
    local.common_route_rules_for_all_subnets,
    #Your Specific Route Rules Here
    [
    ]
  ])

  vcn_prod_jde_ua1_admin_routetable_private_route_rules = flatten([
    local.common_route_rules_for_all_subnets,
    #Your Specific Route Rules Here
    [
    ]
  ])



  vcn_prod_jde_ua1_ldap_routetable_private_route_rules = flatten([
    local.common_route_rules_for_all_subnets,
    #Your Specific Route Rules Here
    [
    ]
  ])



  vcn_prod_jde_ua1_lb_destination_security_rules = [
    {
      "security_list_egress_security_rules_destination"      = local.cidr_blocks.any_ip_range
      "security_list_egress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type" = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"        = var.vcn_prod_jde_ua1_lb_securitylist_is_stateless
    }
  ]


  vcn_prod_jde_ua1_lb_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"      = var.vcn_prod_jde_ua1_cidr_block
      "security_list_ingress_security_rules_protocol"    = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type" = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"   = var.vcn_prod_jde_ua1_lb_securitylist_is_stateless
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]


  vcn_prod_jde_ua1_web_destination_security_rules = [
    {
      "security_list_egress_security_rules_destination"      = "0.0.0.0/0"
      "security_list_egress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type" = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"        = var.vcn_prod_jde_ua1_web_securitylist_is_stateless
      # "security_list_egress_security_rules_port"                  = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]

  vcn_prod_jde_ua1_web_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"      = var.vcn_prod_jde_ua1_cidr_block
      "security_list_ingress_security_rules_protocol"    = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type" = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"   = var.vcn_prod_jde_ua1_web_securitylist_is_stateless
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]

  vcn_prod_jde_ua1_app_destination_security_rules = [
    {
      "security_list_egress_security_rules_destination"      = "0.0.0.0/0"
      "security_list_egress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type" = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"        = var.vcn_prod_jde_ua1_app_securitylist_is_stateless
      # "security_list_egress_security_rules_port"                  = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]

  vcn_prod_jde_ua1_app_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"      = var.vcn_prod_jde_ua1_cidr_block
      "security_list_ingress_security_rules_protocol"    = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type" = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"   = var.vcn_prod_jde_ua1_app_securitylist_is_stateless
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]


  vcn_prod_jde_ua1_admin_destination_security_rules = [
    {
      "security_list_egress_security_rules_destination"      = "0.0.0.0/0"
      "security_list_egress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type" = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"        = var.vcn_prod_jde_ua1_admin_securitylist_is_stateless
      # "security_list_egress_security_rules_port"                  = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]
  vcn_prod_jde_ua1_admin_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"      = var.vcn_prod_jde_ua1_cidr_block
      "security_list_ingress_security_rules_protocol"    = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type" = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"   = var.vcn_prod_jde_ua1_admin_securitylist_is_stateless
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]

  vcn_prod_jde_ua1_ldap_destination_security_rules = [
    {
      "security_list_egress_security_rules_destination"      = "0.0.0.0/0"
      "security_list_egress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type" = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"        = var.vcn_prod_jde_ua1_ldap_securitylist_is_stateless
      # "security_list_egress_security_rules_port"                  = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]

  vcn_prod_jde_ua1_ldap_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"      = var.vcn_prod_jde_ua1_cidr_block
      "security_list_ingress_security_rules_protocol"    = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type" = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"   = var.vcn_prod_jde_ua1_ldap_securitylist_is_stateless
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]
}
