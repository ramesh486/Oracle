locals {

  cidr_blocks_type = {
    cidr_block = "CIDR_BLOCK"
    service_cidr_block = "SERVICE_CIDR_BLOCK"
  }
  compartment_ocid = data.oci_identity_compartments.this.compartments[0].id
  drg_ocid = data.oci_core_drgs.this.drgs[0].id
  
  security_list_protocols = {
    ALL_PROTOCOLS = "all"
    ICMP          = "1"
    TCP           = "6"
    UDP           = "17"
    ICMPv6        = "58"
    icmp_options_type = "3"
    icmp_options_code = "4"
  }
 
  cidr_blocks = {
    any_ip_range    = "0.0.0.0/0"
    all_iad_services_in_oracle_services_network = "all-iad-services-in-oracle-services-network"
  }

  security_list_ports = {
    ssh   = "22"
    https = "443"
  }

  vcn_prod_hub_jde_uas2_routetable_private = [
    {
      "destination"       = "0.0.0.0/0"
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_natgateway.natgateway_ocid
      "destination_type"  = "CIDR_BLOCK"
    },
    {
      "destination"       = local.cidr_blocks.all_iad_services_in_oracle_services_network
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_servicegateway_private.service_gateway_ocid
      "destination_type"  = "SERVICE_CIDR_BLOCK"
    }
  ]
  
  vcn_prod_hub_jde_uas2_routetable_untrust_route_rules = [
    {
      "destination"       = "0.0.0.0/0"
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_intgw.internet_gateway_ocid
      "destination_type"  = "CIDR_BLOCK"
    }
  ]

  vcn_prod_hub_jde_uas2_routetable_private_management_route_rules = [
    {
      "destination"       = "0.0.0.0/0"
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_natgateway.natgateway_ocid
      "destination_type"  = "CIDR_BLOCK"
    },
    {
      "destination"       = local.cidr_blocks.all_iad_services_in_oracle_services_network
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_servicegateway_private.service_gateway_ocid
      "destination_type"  = "SERVICE_CIDR_BLOCK"
    }
  ]

  vcn_prod_hub_jde_uas2_routetable_private_trust_route_rules = [
    {
      "destination"       = "0.0.0.0/0"
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_natgateway.natgateway_ocid
      "destination_type"  = "CIDR_BLOCK"
    },
    {
      "destination"       = local.cidr_blocks.all_iad_services_in_oracle_services_network
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_servicegateway_private.service_gateway_ocid
      "destination_type"  = "SERVICE_CIDR_BLOCK"
    }
  ]

  vcn_prod_hub_jde_uas2_routetable_private_ha_route_rules = [
    {
      "destination"       = "0.0.0.0/0"
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_natgateway.natgateway_ocid
      "destination_type"  = "CIDR_BLOCK"
    },
    {
      "destination"       = local.cidr_blocks.all_iad_services_in_oracle_services_network
      "network_entity_id" = module.vcn_prod_hub_jde_uas2_servicegateway_private.service_gateway_ocid
      "destination_type"  = "SERVICE_CIDR_BLOCK"
    }
  ]

  vcn_prod_hub_jde_uas2_seclist_private_trust_destination_security_rules = [
    {
      "security_list_egress_security_rules_destination"       = local.cidr_blocks.any_ip_range
      "security_list_egress_security_rules_protocol"          = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type"  = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"         = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
    }
  ]
   

  vcn_prod_hub_jde_uas2_seclist_private_trust_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"           = var.vcn_prod_hub_jde_uas2_cidr_block
      "security_list_ingress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type"      = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"        = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
  ]
  

vcn_prod_hub_jde_uas2_seclist_private_ha_destination_security_rules = [
   {
      "security_list_egress_security_rules_destination"           = "0.0.0.0/0"
      "security_list_egress_security_rules_protocol"              = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type"      = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"             = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
      # "security_list_egress_security_rules_port"                  = local.security_list_protocols.ALL_PROTOCOLS
  }
]
vcn_prod_hub_jde_uas2_seclist_private_ha_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"           = var.vcn_prod_hub_jde_uas2_cidr_block
      "security_list_ingress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type"      = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"        = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
]

vcn_prod_hub_jde_uas2_seclist_private_management_destination_security_rules = [
  {
      "security_list_egress_security_rules_destination"           = "0.0.0.0/0"
      "security_list_egress_security_rules_protocol"              = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type"      = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"             = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
      # "security_list_egress_security_rules_port"                  = local.security_list_protocols.ALL_PROTOCOLS
  }
]
vcn_prod_hub_jde_uas2_seclist_private_management_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"           = var.vcn_prod_hub_jde_uas2_cidr_block
      "security_list_ingress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type"      = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"        = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
]


vcn_prod_hub_jde_uas2_seclist_untrust_destination_security_rules = [
  {
      "security_list_egress_security_rules_destination"           = "0.0.0.0/0"
      "security_list_egress_security_rules_protocol"              = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_egress_security_rules_destination_type"      = local.cidr_blocks_type.cidr_block
      "security_list_egress_security_rules_stateless"             = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
      # "security_list_egress_security_rules_port"                  = local.security_list_protocols.ALL_PROTOCOLS
  }
]
vcn_prod_hub_jde_uas2_seclist_untrust_source_security_rules = [
    {
      "security_list_ingress_security_rules_source"           = var.vcn_prod_hub_jde_uas2_cidr_block
      "security_list_ingress_security_rules_protocol"         = local.security_list_protocols.ALL_PROTOCOLS
      "security_list_ingress_security_rules_source_type"      = local.cidr_blocks_type.cidr_block
      "security_list_ingress_security_rules_stateless"        = var.vcn_prod_hub_jde_uas2_seclist_private_is_stateless 
      #  "security_list_ingress_security_rules_port"            = local.security_list_protocols.ALL_PROTOCOLS
    }
]


}
