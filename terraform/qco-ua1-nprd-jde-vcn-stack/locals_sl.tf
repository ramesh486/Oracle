locals {
  security_list_rules = {
    lb = {
      sb = {
        destination_rules = [
          {
            security_list_egress_security_rules_destination      = local.cidr_blocks.any_ip_range
            security_list_egress_security_rules_protocol         = local.security_list_protocols.ALL_PROTOCOLS
            security_list_egress_security_rules_destination_type = local.cidr_blocks_type.cidr_block
            security_list_egress_security_rules_stateless        = false
          }
        ]

        source_rules = [
          {
            security_list_ingress_security_rules_source      = var.onprem_route
            security_list_ingress_security_rules_protocol    = local.security_list_protocols.ALL_PROTOCOLS
            security_list_ingress_security_rules_source_type = local.cidr_blocks_type.cidr_block
            security_list_ingress_security_rules_stateless   = false
          }
        ]
      }

      # Other environments default to empty unless specified
      # ps = {}
      # tr = {}
      # dv = {}
      # qa = {}
      # py = {}
    }
  }






  nprd_vcn_jde_ldap_destination_security_rules = [
    {
      security_list_egress_security_rules_destination      = local.cidr_blocks.any_ip_range
      security_list_egress_security_rules_protocol         = local.security_list_protocols.ALL_PROTOCOLS
      security_list_egress_security_rules_destination_type = local.cidr_blocks_type.cidr_block
      security_list_egress_security_rules_stateless        = false
    }
  ]

  nprd_vcn_jde_ldap_source_security_rules = [
    {
      security_list_ingress_security_rules_source      = var.nprd_vcn_cidr_block
      security_list_ingress_security_rules_protocol    = local.security_list_protocols.ALL_PROTOCOLS
      security_list_ingress_security_rules_source_type = local.cidr_blocks_type.cidr_block
      security_list_ingress_security_rules_stateless   = false
    }
  ]
}
