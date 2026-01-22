# ----------------------------------------
# Prod HUB VCN Module
# ----------------------------------------

module "vcn_prod_hub" {
  source                = "./vcn_module"
  compartment_ocid      = local.compartment_ocid
  vcn_display_name      = var.vcn_prod_hub_display_name
  vcn_dns_label         = var.vcn_prod_hub_dns_label
  vcn_cidr_block        = [var.vcn_prod_hub_cidr_block]
  definedTags           = var.project_tag.definedTags
  freeformTags          = var.project_tag.freeformTags
}

# ----------------------------------------
# Prod HUB VCN Security List Module
# ----------------------------------------

module "vcn_prod_hub_seclist_private_trust" {
  source                                                = "./private_security_list_module"
  compartment_ocid                                      = local.compartment_ocid
  definedTags                                           = var.prod_trust_project_tag.definedTags
  freeformTags                                          = var.prod_trust_project_tag.freeformTags
  security_list_display_name                            = var.vcn_prod_hub_seclist_private_trust_display_name
  destination_security_rules                            = local.vcn_prod_hub_seclist_private_trust_destination_security_rules
  source_security_rules                                 = local.vcn_prod_hub_seclist_private_trust_source_security_rules
  vcn_ocid                                              = module.vcn_prod_hub.vcn_ocid
}


module "vcn_prod_hub_seclist_private_ha" {
  source                                                = "./private_security_list_module"
  compartment_ocid                                      = local.compartment_ocid
  definedTags                                           = var.prod_ha_private_subnet_project_tag.definedTags
  freeformTags                                          = var.prod_ha_private_subnet_project_tag.freeformTags
  security_list_display_name                            = var.vcn_prod_hub_seclist_private_ha_display_name
  destination_security_rules                            = local.vcn_prod_hub_seclist_private_ha_destination_security_rules
  source_security_rules                                 = local.vcn_prod_hub_seclist_private_ha_source_security_rules
  vcn_ocid                                              = module.vcn_prod_hub.vcn_ocid
}


module "vcn_prod_hub_seclist_private_management" {
  source                                                = "./private_security_list_module"
  compartment_ocid                                      = local.compartment_ocid
  definedTags                                           = var.prod_management_project_tag.definedTags
  freeformTags                                          = var.prod_management_project_tag.freeformTags
  security_list_display_name                            = var.vcn_prod_hub_seclist_private_management_display_name
  destination_security_rules                            = local.vcn_prod_hub_seclist_private_management_destination_security_rules
  source_security_rules                                 = local.vcn_prod_hub_seclist_private_management_source_security_rules
  vcn_ocid                                              = module.vcn_prod_hub.vcn_ocid
}

module "vcn_prod_hub_seclist_untrust" {
  source                                                = "./private_security_list_module"
  compartment_ocid                                      = local.compartment_ocid
  definedTags                                           = var.prod_untrust_project_tag.definedTags
  freeformTags                                          = var.prod_untrust_project_tag.freeformTags
  security_list_display_name                            = var.vcn_prod_hub_seclist_untrust_display_name
  destination_security_rules                            = local.vcn_prod_hub_seclist_untrust_destination_security_rules
  source_security_rules                                 = local.vcn_prod_hub_seclist_untrust_source_security_rules
  vcn_ocid                                              = module.vcn_prod_hub.vcn_ocid
}



# ----------------------------------------
# Prod HUB VCN Route Table Modules
# ----------------------------------------

module "vcn_prod_hub_routetable_untrust" {
  source                                    = "./private_route_table_module"
  compartment_ocid                          = local.compartment_ocid 
  definedTags                               = var.prod_untrust_project_tag.definedTags
  freeformTags                              = var.prod_untrust_project_tag.freeformTags
  route_table_display_name                  = var.vcn_prod_hub_routetable_untrust_display_name
  vcn_ocid                                  = module.vcn_prod_hub.vcn_ocid
  route_rules                               = local.vcn_prod_hub_routetable_untrust_route_rules
}


module "vcn_prod_hub_routetable_private_management" {
  source                                    = "./private_route_table_module"
  compartment_ocid                          = local.compartment_ocid 
  definedTags                               = var.prod_management_project_tag.definedTags
  freeformTags                              = var.prod_management_project_tag.freeformTags
  route_table_display_name                  = var.vcn_prod_hub_routetable_private_management_display_name
  vcn_ocid                                  = module.vcn_prod_hub.vcn_ocid
  route_rules                               = local.vcn_prod_hub_routetable_private_management_route_rules               
}

module "vcn_prod_hub_routetable_private_trust" {
  source                                    = "./private_route_table_module"
  compartment_ocid                          = local.compartment_ocid 
  definedTags                               = var.prod_trust_project_tag.definedTags
  freeformTags                              = var.prod_trust_project_tag.freeformTags
  route_table_display_name                  = var.vcn_prod_hub_routetable_private_trust_display_name
  vcn_ocid                                  = module.vcn_prod_hub.vcn_ocid
  route_rules                               = local.vcn_prod_hub_routetable_private_trust_route_rules               
}


module "vcn_prod_hub_routetable_private_ha" {
  source                                    = "./private_route_table_module"
  compartment_ocid                          = local.compartment_ocid 
  definedTags                               = var.prod_ha_private_subnet_project_tag.definedTags
  freeformTags                              = var.prod_ha_private_subnet_project_tag.freeformTags
  route_table_display_name                  = var.vcn_prod_hub_routetable_private_ha_display_name
  vcn_ocid                                  = module.vcn_prod_hub.vcn_ocid
  route_rules                               = local.vcn_prod_hub_routetable_private_ha_route_rules               
}


module "vcn_prod_hub_routetable_vcn_hub_ingress" {
  source                                    = "./private_route_table_module"
  compartment_ocid                          = local.compartment_ocid 
  definedTags                               = var.project_tag.definedTags
  freeformTags                              = var.project_tag.freeformTags
  route_table_display_name                  = var.vcn_prod_hub_routetable_vcn_hub_ingress_display_name
  vcn_ocid                                  = module.vcn_prod_hub.vcn_ocid
  route_rules                               = local.vcn_prod_hub_routetable_vcn_hub_ingress_route_rules               
}


module "vcn_prod_hub_routetable_vcn_hub_lpg" {
  source                                    = "./private_route_table_module"
  compartment_ocid                          = local.compartment_ocid 
  definedTags                               = var.project_tag.definedTags
  freeformTags                              = var.project_tag.freeformTags
  route_table_display_name                  = var.vcn_prod_hub_routetable_vcn_hub_lpg_display_name
  vcn_ocid                                  = module.vcn_prod_hub.vcn_ocid
  route_rules                               = local.vcn_prod_hub_routetable_vcn_hub_lpg_route_rules               
}




# ----------------------------------------
# DRG Attachment Module
# ----------------------------------------

module "drg_import_route_distribution" {
    source                                      = "./drg_route_distribution"
    compartment_ocid                            = local.compartment_ocid
    definedTags                                 = var.project_tag.definedTags
    freeformTags                                = var.project_tag.freeformTags
    drg_route_distribution_distribution_type    = var.drg_route_distribution_distribution_type
    drg_ocid                                    = local.drg_ocid
    drg_route_distribution_display_name         = var.drg_route_distribution_display_name
}



module "drg_route_distribution_statements" {
    source                                                                      = "./drg_route_distribution_statements"
    compartment_ocid                                                            = local.compartment_ocid
    definedTags                                                                 = var.project_tag.definedTags
    freeformTags                                                                = var.project_tag.freeformTags
    drg_route_distribution_ocid                                                 = module.drg_import_route_distribution.drg_route_distribution_ocid
    drg_route_distribution_statement_statements_action                          = var.drg_route_distribution_statement_statements_action
    drg_route_distribution_statement_statements_match_criteria_match_type       = var.drg_route_distribution_statement_statements_match_criteria_match_type
    drg_route_distribution_statement_statements_match_criteria_attachment_type  = var.drg_route_distribution_statement_statements_match_criteria_attachment_type
    drg_attachment_ocid                                                         = null
    drg_route_distribution_statement_statements_priority                        = var.drg_route_distribution_statement_statements_priority
}


module "drg_route_table_hub_vcn" {
    source                          = "./drg_route_table"
    compartment_ocid                = local.compartment_ocid
    definedTags                     = var.project_tag.definedTags
    freeformTags                    = var.project_tag.freeformTags
    drg_route_distribution_ocid     = module.drg_import_route_distribution.drg_route_distribution_ocid
    drg_route_table_display_name    = var.hub_vcn_drg_attachment_route_table_display_name
    drg_route_table_is_ecmp_enabled = var.hub_vcn_drg_attachment_route_table_is_ecmp_enabled
    drg_ocid                        = local.drg_ocid
}

module "drg_route_table_spoke_vcn" {
    source                          = "./drg_route_table"
    compartment_ocid                = local.compartment_ocid
    definedTags                     = var.project_tag.definedTags
    freeformTags                    = var.project_tag.freeformTags
    drg_route_distribution_ocid     = var.attach_import_route_distribution_to_spoke == false ? null : module.drg_import_route_distribution.drg_route_distribution_ocid
    drg_route_table_display_name    = var.spoke_vcn_drg_attachment_route_table_display_name
    drg_route_table_is_ecmp_enabled = var.spoke_vcn_drg_attachment_route_table_is_ecmp_enabled
    drg_ocid                        = local.drg_ocid
}

module "vcn_prod_hub_drg_attachment" {
    source                                  = "./drg_attachments"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.project_tag.definedTags
    freeformTags                            = var.project_tag.freeformTags
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid  
    drg_ocid                                = local.drg_ocid
    oci_core_drg_attachment_display_name    = var.vcn_prod_hub_drg_attachment_display_name
    drg_route_table_ocid                    = module.drg_route_table_hub_vcn.drg_route_table_ocid
    vcn_route_table_ocid                    = module.vcn_prod_hub_routetable_vcn_hub_ingress.route_table_ocid
}

module "drg_route_table_spoke_vcn_route_rule" {
    source                                      = "./drg_route_table_statements"
    compartment_ocid                            = local.compartment_ocid
    definedTags                                 = var.project_tag.definedTags
    freeformTags                                = var.project_tag.freeformTags
    drg_attachment_ocid                         = module.vcn_prod_hub_drg_attachment.drg_attachment_ocid
    drg_route_table_route_rule_destination      = var.vcn_prod_hub_drg_attachment_route_table_route_rule_destination
    drg_route_table_route_rule_destination_type = var.vcn_prod_hub_drg_attachment_route_table_route_rule_destination_type
    drg_route_table_ocid                        = module.drg_route_table_spoke_vcn.drg_route_table_ocid
}

# ----------------------------------------
# LPG Attachment Module
# ----------------------------------------

module "vcn_prod_hub_vcn_to_prod_jde_vcn_lpg_attachment" {
    source                                  = "./lpg_attachments"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.project_tag.definedTags
    freeformTags                            = var.project_tag.freeformTags
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    peering_lpg_ocid                        = null
    attach_vcn_route_table_to_lpg           = true
    vcn_lpg_route_table_ocid                = module.vcn_prod_hub_routetable_vcn_hub_lpg.route_table_ocid
    local_peering_gateway_display_name      = var.prod_hub_vcn_to_prod_jde_vcn_lpg_display_name
}


module "vcn_prod_hub_vcn_to_nprd_jde_vcn_lpg_attachment" {
    source                                  = "./lpg_attachments"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.project_tag.definedTags
    freeformTags                            = var.project_tag.freeformTags
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    peering_lpg_ocid                        = null
    attach_vcn_route_table_to_lpg           = true
    vcn_lpg_route_table_ocid                = module.vcn_prod_hub_routetable_vcn_hub_lpg.route_table_ocid
    local_peering_gateway_display_name      = var.prod_hub_vcn_to_nprd_jde_vcn_lpg_display_name
}



module "vcn_prod_hub_vcn_to_prod_nonjde_vcn_lpg_attachment" {
    source                                  = "./lpg_attachments"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.project_tag.definedTags
    freeformTags                            = var.project_tag.freeformTags
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    peering_lpg_ocid                        = null
    attach_vcn_route_table_to_lpg           = true
    vcn_lpg_route_table_ocid                = module.vcn_prod_hub_routetable_vcn_hub_lpg.route_table_ocid
    local_peering_gateway_display_name      = var.prod_hub_vcn_to_prod_nonjde_vcn_lpg_display_name
}

module "vcn_prod_hub_vcn_to_nprd_nonjde_vcn_lpg_attachment" {
    source                                  = "./lpg_attachments"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.project_tag.definedTags
    freeformTags                            = var.project_tag.freeformTags
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    peering_lpg_ocid                        = null
    attach_vcn_route_table_to_lpg           = true
    vcn_lpg_route_table_ocid                = module.vcn_prod_hub_routetable_vcn_hub_lpg.route_table_ocid
    local_peering_gateway_display_name      = var.prod_hub_vcn_to_nprd_nonjde_vcn_lpg_display_name
}


module "vcn_prod_hub_vcn_to_exadata_jde_vcn_lpg_attachment" {
    source                                  = "./lpg_attachments"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.project_tag.definedTags
    freeformTags                            = var.project_tag.freeformTags
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    peering_lpg_ocid                        = null
    attach_vcn_route_table_to_lpg           = true
    vcn_lpg_route_table_ocid                = module.vcn_prod_hub_routetable_vcn_hub_lpg.route_table_ocid
    local_peering_gateway_display_name      = var.prod_hub_vcn_to_prod_exadata_vcn_lpg_display_name
}



# ----------------------------------------
#  Service Gateway Module
# ----------------------------------------

module "vcn_prod_hub_servicegateway_private" {
    source                  = "./service_gw_module"
    compartment_ocid        = local.compartment_ocid
    definedTags             = var.project_tag.definedTags
    freeformTags            = var.project_tag.freeformTags
    vcn_ocid                = module.vcn_prod_hub.vcn_ocid
    servicegw_display_name  = var.vcn_prod_hub_servicegateway_private_display_name
}

# ----------------------------------------
#  NAT Gateway Module
# ----------------------------------------

module "vcn_prod_hub_natgateway" {
    source              = "./nat_gw_module"
    compartment_ocid    = local.compartment_ocid
    definedTags         = var.project_tag.definedTags
    freeformTags        = var.project_tag.freeformTags
    vcn_ocid            = module.vcn_prod_hub.vcn_ocid
    natgw_display_name  = var.vcn_prod_hub_natgateway_display_name
    natgw_block_traffic = var.vcn_prod_hub_natgateway_block_traffic
    public_ip_lifetime  = var.vcn_prod_hub_natgateway_public_ip_lifetime
}
# ----------------------------------------
#  Internet Gateway Module
# ----------------------------------------

module "vcn_prod_hub_intgw" {
    source              = "./internet_gw_module"
    compartment_ocid    = local.compartment_ocid
    definedTags         = var.project_tag.definedTags
    freeformTags        = var.project_tag.freeformTags
    vcn_ocid            = module.vcn_prod_hub.vcn_ocid
    intgw_display_name  = var.vcn_prod_hub_intgw_display_name
    intgw_enabled = var.vcn_prod_hub_intgw_enabled
   

}

# ----------------------------------------
# Prod ha Public Subnet Configuration Module
# ----------------------------------------

module "prod_ha_private_subnet" {
    source                                  = "./subnet_module"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.prod_ha_private_subnet_project_tag.definedTags
    freeformTags                            = var.prod_ha_private_subnet_project_tag.freeformTags
    vcn_subnet_display_name                 = var.prod_ha_private_subnet_display_name
    vcn_subnet_dns_label                    = var.prod_ha_private_subnet_dns_label
    vcn_subnet_cidr_block                   = var.prod_ha_private_subnet_cidr_block
    route_table_ocid                        = module.vcn_prod_hub_routetable_private_ha.route_table_ocid
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    vcn_subnet_prohibit_internet_ingress    = var.prod_ha_private_subnet_prohibit_internet_ingress
    vcn_subnet_prohibit_public_ip_on_vnic   = var.prod_ha_private_subnet_prohibit_public_ip_on_vnic
    dhcp_options_ocid                       = module.vcn_prod_hub.default_dhcp_options_ocid
    security_list_ocid                      = module.vcn_prod_hub_seclist_private_ha.security_list_ocid
}


# ----------------------------------------
# Prod Untrust Subnet Configuration Module
# ----------------------------------------

module "prod_untrust_subnet" {
    source                                  = "./subnet_module"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.prod_untrust_project_tag.definedTags
    freeformTags                            = var.prod_untrust_project_tag.freeformTags
    vcn_subnet_display_name                 = var.prod_untrust_subnet_display_name
    vcn_subnet_dns_label                    = var.prod_untrust_subnet_dns_label
    vcn_subnet_cidr_block                   = var.prod_untrust_subnet_cidr_block
    route_table_ocid                        = module.vcn_prod_hub_routetable_untrust.route_table_ocid
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    vcn_subnet_prohibit_internet_ingress    = var.prod_untrust_subnet_prohibit_internet_ingress
    vcn_subnet_prohibit_public_ip_on_vnic   = var.prod_untrust_subnet_prohibit_public_ip_on_vnic
    dhcp_options_ocid                       = module.vcn_prod_hub.default_dhcp_options_ocid
    security_list_ocid                      = module.vcn_prod_hub_seclist_untrust.security_list_ocid
}



# ----------------------------------------
# Prod Management Subnet Configuration Module
# ----------------------------------------

module "prod_management_subnet" {
    source                                  = "./subnet_module"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.prod_management_project_tag.definedTags
    freeformTags                            = var.prod_management_project_tag.freeformTags
    vcn_subnet_display_name                 = var.prod_management_subnet_display_name
    vcn_subnet_dns_label                    = var.prod_management_subnet_dns_label
    vcn_subnet_cidr_block                   = var.prod_management_subnet_cidr_block
    route_table_ocid                        = module.vcn_prod_hub_routetable_private_management.route_table_ocid
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    vcn_subnet_prohibit_internet_ingress    = var.prod_management_subnet_prohibit_internet_ingress
    vcn_subnet_prohibit_public_ip_on_vnic   = var.prod_management_subnet_prohibit_public_ip_on_vnic
    dhcp_options_ocid                       = module.vcn_prod_hub.default_dhcp_options_ocid
    security_list_ocid                      = module.vcn_prod_hub_seclist_private_management.security_list_ocid
}


# ----------------------------------------
# Prod Trust Subnet Configuration Module
# ----------------------------------------

module "prod_trust_subnet" {
    source                                  = "./subnet_module"
    compartment_ocid                        = local.compartment_ocid
    definedTags                             = var.prod_trust_project_tag.definedTags
    freeformTags                            = var.prod_trust_project_tag.freeformTags
    vcn_subnet_display_name                 = var.prod_trust_subnet_display_name
    vcn_subnet_dns_label                    = var.prod_trust_subnet_dns_label
    vcn_subnet_cidr_block                   = var.prod_trust_subnet_cidr_block
    route_table_ocid                        = module.vcn_prod_hub_routetable_private_trust.route_table_ocid
    vcn_ocid                                = module.vcn_prod_hub.vcn_ocid
    vcn_subnet_prohibit_internet_ingress    = var.prod_trust_subnet_prohibit_internet_ingress
    vcn_subnet_prohibit_public_ip_on_vnic   = var.prod_trust_subnet_prohibit_public_ip_on_vnic
    dhcp_options_ocid                       = module.vcn_prod_hub.default_dhcp_options_ocid
    security_list_ocid                      = module.vcn_prod_hub_seclist_private_trust.security_list_ocid
}


