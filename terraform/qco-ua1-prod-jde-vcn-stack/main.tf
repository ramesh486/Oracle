# ----------------------------------------
# Prod HUB VCN Module : vcn-prod-hub-jde-ua1
# ----------------------------------------

module "vcn_prod_jde_ua1" {
  source           = "./vcn_module"
  compartment_ocid = local.compartment_ocid
  vcn_display_name = var.vcn_prod_jde_ua1_display_name
  vcn_dns_label    = var.vcn_prod_jde_ua1_dns_label
  vcn_cidr_block   = var.vcn_prod_jde_ua1_cidr_block
  definedTags      = var.project_tag.definedTags
  freeformTags     = var.project_tag.freeformTags
}

#  Service Gateway Module
module "vcn_prod_jde_ua1_servicegateway_private" {
  source                 = "./service_gw_module"
  compartment_ocid       = local.compartment_ocid
  definedTags            = var.project_tag.definedTags
  freeformTags           = var.project_tag.freeformTags
  vcn_ocid               = module.vcn_prod_jde_ua1.vcn_ocid
  servicegw_display_name = var.vcn_prod_jde_ua1_servicegateway_private_display_name
}

#  NAT Gateway Module
module "vcn_prod_jde_ua1_natgateway" {
  source              = "./nat_gw_module"
  compartment_ocid    = local.compartment_ocid
  definedTags         = var.project_tag.definedTags
  freeformTags        = var.project_tag.freeformTags
  vcn_ocid            = module.vcn_prod_jde_ua1.vcn_ocid
  natgw_display_name  = var.vcn_prod_jde_ua1_natgateway_display_name
  natgw_block_traffic = var.vcn_prod_jde_ua1_natgateway_block_traffic
  public_ip_lifetime  = var.vcn_prod_jde_ua1_natgateway_public_ip_lifetime
}


# ----------------------------------------
# DRG Attachment Module
# ----------------------------------------

module "vcn_prod_jde_ua1_drg_attachment" {
  source                               = "./drg_attachments"
  compartment_ocid                     = local.compartment_ocid
  definedTags                          = var.project_tag.definedTags
  freeformTags                         = var.project_tag.freeformTags
  vcn_ocid                             = module.vcn_prod_jde_ua1.vcn_ocid
  drg_ocid                             = local.drg_ocid
  drg_route_table_ocid                 = var.route_to_exadata_vcn_using_drg == true ? local.spoke_vcn_drg_route_table_ocid : null
  oci_core_drg_attachment_display_name = var.vcn_prod_jde_ua1_drg_attachment_display_name
}

# ----------------------------------------
# LPG Attachment Module
# ----------------------------------------


module "vcn_prod_jde_to_prod_hub_lpg_attachment" {
  source                             = "./lpg_attachments"
  compartment_ocid                   = local.compartment_ocid
  definedTags                        = var.project_tag.definedTags
  freeformTags                       = var.project_tag.freeformTags
  vcn_ocid                           = module.vcn_prod_jde_ua1.vcn_ocid
  peering_lpg_ocid                   = local.peering_prod_hub_lpg_ocid
  attach_vcn_route_table_to_lpg      = false
  local_peering_gateway_display_name = var.prod_jde_vcn_to_prod_hub_vcn_lpg_display_name
}

module "vcn_prod_jde_to_prod_exadata_lpg_attachment" {
  source                             = "./lpg_attachments"
  compartment_ocid                   = local.compartment_ocid
  definedTags                        = var.project_tag.definedTags
  freeformTags                       = var.project_tag.freeformTags
  vcn_ocid                           = module.vcn_prod_jde_ua1.vcn_ocid
  peering_lpg_ocid                   = local.peering_prod_exadata_vcn_lpg_ocid
  attach_vcn_route_table_to_lpg      = false
  local_peering_gateway_display_name = var.prod_jde_vcn_to_prod_exadata_vcn_lpg_display_name
}



###############   prod_sn_prod_jde_lb ################

module "sn_prod_jde_lb" {
  source                                = "./subnet_module"
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = var.project_tag.definedTags
  freeformTags                          = var.project_tag.freeformTags
  vcn_subnet_display_name               = var.sn_prod_jde_lb_display_name
  vcn_subnet_dns_label                  = var.sn_prod_jde_lb_dns_label
  vcn_subnet_cidr_block                 = var.sn_prod_jde_lb_cidr_block
  route_table_ocid                      = module.vcn_prod_jde_ua1_lb_routetable_private.route_table_ocid
  vcn_ocid                              = module.vcn_prod_jde_ua1.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = var.sn_prod_jde_lb_prohibit_internet_ingress
  vcn_subnet_prohibit_public_ip_on_vnic = var.sn_prod_jde_lb_prohibit_public_ip_on_vnic
  dhcp_options_ocid                     = module.vcn_prod_jde_ua1.default_dhcp_options_ocid
  security_list_ocid                    = module.vcn_prod_jde_ua1_lb_securitylist.security_list_ocid
}

###############   sn_prod_jde_web ################

module "sn_prod_jde_web" {
  source                                = "./subnet_module"
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = var.project_tag.definedTags
  freeformTags                          = var.project_tag.freeformTags
  vcn_subnet_display_name               = var.sn_prod_jde_web_display_name
  vcn_subnet_dns_label                  = var.sn_prod_jde_web_dns_label
  vcn_subnet_cidr_block                 = var.sn_prod_jde_web_cidr_block
  route_table_ocid                      = module.vcn_prod_jde_ua1_web_routetable_private.route_table_ocid
  vcn_ocid                              = module.vcn_prod_jde_ua1.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = var.sn_prod_jde_web_prohibit_internet_ingress
  vcn_subnet_prohibit_public_ip_on_vnic = var.sn_prod_jde_web_prohibit_public_ip_on_vnic
  dhcp_options_ocid                     = module.vcn_prod_jde_ua1.default_dhcp_options_ocid
  security_list_ocid                    = module.vcn_prod_jde_ua1_web_securitylist.security_list_ocid
}

###############   prod_app_subnet ################
module "sn_prod_jde_app" {
  source                                = "./subnet_module"
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = var.project_tag.definedTags
  freeformTags                          = var.project_tag.freeformTags
  vcn_subnet_display_name               = var.sn_prod_jde_app_display_name
  vcn_subnet_dns_label                  = var.sn_prod_jde_app_dns_label
  vcn_subnet_cidr_block                 = var.sn_prod_jde_app_cidr_block
  route_table_ocid                      = module.vcn_prod_jde_ua1_app_routetable_private.route_table_ocid
  vcn_ocid                              = module.vcn_prod_jde_ua1.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = var.sn_prod_jde_app_prohibit_internet_ingress
  vcn_subnet_prohibit_public_ip_on_vnic = var.sn_prod_jde_app_prohibit_public_ip_on_vnic
  dhcp_options_ocid                     = module.vcn_prod_jde_ua1.default_dhcp_options_ocid
  security_list_ocid                    = module.vcn_prod_jde_ua1_app_securitylist.security_list_ocid
}

###############   sn_prod_jde_admin ################

module "sn_prod_jde_admin" {
  source                                = "./subnet_module"
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = var.project_tag.definedTags
  freeformTags                          = var.project_tag.freeformTags
  vcn_subnet_display_name               = var.sn_prod_jde_admin_display_name
  vcn_subnet_dns_label                  = var.sn_prod_jde_admin_dns_label
  vcn_subnet_cidr_block                 = var.sn_prod_jde_admin_cidr_block
  route_table_ocid                      = module.vcn_prod_jde_ua1_admin_routetable_private.route_table_ocid
  vcn_ocid                              = module.vcn_prod_jde_ua1.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = var.sn_prod_jde_admin_cidr_block_prohibit_internet_ingress
  vcn_subnet_prohibit_public_ip_on_vnic = var.sn_prod_jde_admin_prohibit_public_ip_on_vnic
  dhcp_options_ocid                     = module.vcn_prod_jde_ua1.default_dhcp_options_ocid
  security_list_ocid                    = module.vcn_prod_jde_ua1_admin_securitylist.security_list_ocid
}

###############   sn_prod_jde_ldap ################

module "sn_prod_jde_ldap" {
  source                                = "./subnet_module"
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = var.project_tag.definedTags
  freeformTags                          = var.project_tag.freeformTags
  vcn_subnet_display_name               = var.sn_prod_jde_ldap_display_name
  vcn_subnet_dns_label                  = var.sn_prod_jde_ldap_dns_label
  vcn_subnet_cidr_block                 = var.sn_prod_jde_ldap_cidr_block
  route_table_ocid                      = module.vcn_prod_jde_ua1_ldap_routetable_private.route_table_ocid
  vcn_ocid                              = module.vcn_prod_jde_ua1.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = var.sn_prod_jde_ldap_prohibit_internet_ingress
  vcn_subnet_prohibit_public_ip_on_vnic = var.sn_prod_jde_ldap_prohibit_public_ip_on_vnic
  dhcp_options_ocid                     = module.vcn_prod_jde_ua1.default_dhcp_options_ocid
  security_list_ocid                    = module.vcn_prod_jde_ua1_ldap_securitylist.security_list_ocid
}


# ----------------------------------------
# Prod VCN Security List Module
# ----------------------------------------

module "vcn_prod_jde_ua1_lb_securitylist" {
  source                     = "./private_security_list_module"
  compartment_ocid           = local.compartment_ocid
  definedTags                = var.project_tag.definedTags
  freeformTags               = var.project_tag.freeformTags
  security_list_display_name = var.vcn_prod_jde_ua1_lb_securitylist_display_name
  destination_security_rules = local.vcn_prod_jde_ua1_lb_destination_security_rules
  source_security_rules      = local.vcn_prod_jde_ua1_lb_source_security_rules
  vcn_ocid                   = module.vcn_prod_jde_ua1.vcn_ocid
}

module "vcn_prod_jde_ua1_web_securitylist" {
  source                     = "./private_security_list_module"
  compartment_ocid           = local.compartment_ocid
  definedTags                = var.project_tag.definedTags
  freeformTags               = var.project_tag.freeformTags
  security_list_display_name = var.vcn_prod_jde_ua1_web_securitylist_display_name
  destination_security_rules = local.vcn_prod_jde_ua1_web_destination_security_rules
  source_security_rules      = local.vcn_prod_jde_ua1_web_source_security_rules
  vcn_ocid                   = module.vcn_prod_jde_ua1.vcn_ocid
}

module "vcn_prod_jde_ua1_app_securitylist" {
  source                     = "./private_security_list_module"
  compartment_ocid           = local.compartment_ocid
  definedTags                = var.project_tag.definedTags
  freeformTags               = var.project_tag.freeformTags
  security_list_display_name = var.vcn_prod_jde_ua1_app_securitylist_display_name
  destination_security_rules = local.vcn_prod_jde_ua1_app_destination_security_rules
  source_security_rules      = local.vcn_prod_jde_ua1_app_source_security_rules
  vcn_ocid                   = module.vcn_prod_jde_ua1.vcn_ocid
}

module "vcn_prod_jde_ua1_admin_securitylist" {
  source                     = "./private_security_list_module"
  compartment_ocid           = local.compartment_ocid
  definedTags                = var.project_tag.definedTags
  freeformTags               = var.project_tag.freeformTags
  security_list_display_name = var.vcn_prod_jde_ua1_admin_securitylist_display_name
  destination_security_rules = local.vcn_prod_jde_ua1_admin_destination_security_rules
  source_security_rules      = local.vcn_prod_jde_ua1_admin_source_security_rules
  vcn_ocid                   = module.vcn_prod_jde_ua1.vcn_ocid
}

module "vcn_prod_jde_ua1_ldap_securitylist" {
  source                     = "./private_security_list_module"
  compartment_ocid           = local.compartment_ocid
  definedTags                = var.project_tag.definedTags
  freeformTags               = var.project_tag.freeformTags
  security_list_display_name = var.vcn_prod_jde_ua1_ldap_securitylist_display_name
  destination_security_rules = local.vcn_prod_jde_ua1_ldap_destination_security_rules
  source_security_rules      = local.vcn_prod_jde_ua1_ldap_source_security_rules
  vcn_ocid                   = module.vcn_prod_jde_ua1.vcn_ocid
}


# ----------------------------------------
# VCN Route Table Modules
# ----------------------------------------

module "vcn_prod_jde_ua1_lb_routetable_private" {
  source                   = "./private_route_table_module"
  compartment_ocid         = local.compartment_ocid
  definedTags              = var.project_tag.definedTags
  freeformTags             = var.project_tag.freeformTags
  route_table_display_name = var.vcn_prod_jde_ua1_routetable_private_lb_display_name
  vcn_ocid                 = module.vcn_prod_jde_ua1.vcn_ocid
  route_rules              = local.vcn_prod_jde_ua1_lb_routetable_private_route_rules
}

module "vcn_prod_jde_ua1_web_routetable_private" {
  source                   = "./private_route_table_module"
  compartment_ocid         = local.compartment_ocid
  definedTags              = var.project_tag.definedTags
  freeformTags             = var.project_tag.freeformTags
  route_table_display_name = var.vcn_prod_jde_ua1_routetable_private_web_display_name
  vcn_ocid                 = module.vcn_prod_jde_ua1.vcn_ocid
  route_rules              = local.vcn_prod_jde_ua1_web_routetable_private_route_rules
}


module "vcn_prod_jde_ua1_app_routetable_private" {
  source                   = "./private_route_table_module"
  compartment_ocid         = local.compartment_ocid
  definedTags              = var.project_tag.definedTags
  freeformTags             = var.project_tag.freeformTags
  route_table_display_name = var.vcn_prod_jde_ua1_routetable_private_app_display_name
  vcn_ocid                 = module.vcn_prod_jde_ua1.vcn_ocid
  route_rules              = local.vcn_prod_jde_ua1_app_routetable_private_route_rules
}


module "vcn_prod_jde_ua1_admin_routetable_private" {
  source                   = "./private_route_table_module"
  compartment_ocid         = local.compartment_ocid
  definedTags              = var.project_tag.definedTags
  freeformTags             = var.project_tag.freeformTags
  route_table_display_name = var.vcn_prod_jde_ua1_routetable_private_admin_display_name
  vcn_ocid                 = module.vcn_prod_jde_ua1.vcn_ocid
  route_rules              = local.vcn_prod_jde_ua1_admin_routetable_private_route_rules
}

module "vcn_prod_jde_ua1_ldap_routetable_private" {
  source                   = "./private_route_table_module"
  compartment_ocid         = local.compartment_ocid
  definedTags              = var.project_tag.definedTags
  freeformTags             = var.project_tag.freeformTags
  route_table_display_name = var.vcn_prod_jde_ua1_routetable_private_ldap_display_name
  vcn_ocid                 = module.vcn_prod_jde_ua1.vcn_ocid
  route_rules              = local.vcn_prod_jde_ua1_ldap_routetable_private_route_rules
}


