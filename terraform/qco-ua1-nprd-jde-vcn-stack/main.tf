# ----------------------------------------
# NonProd VCN Module
# ----------------------------------------

module "vcn_nprd_jde" {
  source           = "./vcn_module"
  compartment_ocid = local.compartment_ocid
  vcn_display_name = var.nprd_vcn_display_name
  vcn_dns_label    = var.nprd_vcn_dns_label
  vcn_cidr_block   = [var.nprd_vcn_cidr_block]
  definedTags      = var.project_tag.definedTags
  freeformTags     = var.project_tag.freeformTags
}


# ----------------------------------------
# Service Gateway Module
# ----------------------------------------
module "vcn_nprd_servicegateway_private" {
  source                 = "./service_gw_module"
  compartment_ocid       = local.compartment_ocid
  definedTags            = var.project_tag.definedTags
  freeformTags           = var.project_tag.freeformTags
  vcn_ocid               = module.vcn_nprd_jde.vcn_ocid
  servicegw_display_name = var.nprd_vcn_servicegateway_private_display_name
}

# ----------------------------------------
# NAT GATEWAY Module
# ----------------------------------------
module "vcn_nprd_natgateway" {
  source              = "./nat_gw_module"
  compartment_ocid    = local.compartment_ocid
  definedTags         = var.project_tag.definedTags
  freeformTags        = var.project_tag.freeformTags
  vcn_ocid            = module.vcn_nprd_jde.vcn_ocid
  natgw_display_name  = var.nprd_vcn_natgateway_display_name
  natgw_block_traffic = var.nprd_vcn_natgateway_block_traffic
  public_ip_lifetime  = var.nprd_vcn_natgateway_public_ip_lifetime
}


# ----------------------------------------
# DRG Attachment Module
# ----------------------------------------

module "vcn_nprd_jde_drg_attachment" {
  source                               = "./drg_attachments"
  compartment_ocid                     = local.compartment_ocid
  definedTags                          = var.project_tag.definedTags
  freeformTags                         = var.project_tag.freeformTags
  vcn_ocid                             = module.vcn_nprd_jde.vcn_ocid
  drg_ocid                             = local.drg_ocid
  drg_route_table_ocid                 = local.spoke_vcn_drg_route_table_ocid
  oci_core_drg_attachment_display_name = var.nprd_vcn_drg_attachment_display_name
}


# ----------------------------------------
# LPG Attachment Module
# ----------------------------------------

module "vcn_nprd_jde_vcn_to_exadata_vcn_lpg_attachment" {
  source                             = "./lpg_attachments"
  compartment_ocid                   = local.compartment_ocid
  definedTags                        = var.project_tag.definedTags
  freeformTags                       = var.project_tag.freeformTags
  vcn_ocid                           = module.vcn_nprd_jde.vcn_ocid
  initiate_lpg_peering               = true
  lpg_peering_ocid                   = local.peering_lpg_ocid
  attach_routetable_to_lpg           = false
  lpg_route_table_ocid               = null
  local_peering_gateway_display_name = var.nprd_jde_vcn_to_exadata_vcn_lpg_display_name
}

module "vcn_nprd_jde_vcn_to_prod_hub_vcn_lpg_attachment" {
  source                             = "./lpg_attachments"
  compartment_ocid                   = local.compartment_ocid
  definedTags                        = var.project_tag.definedTags
  freeformTags                       = var.project_tag.freeformTags
  vcn_ocid                           = module.vcn_nprd_jde.vcn_ocid
  initiate_lpg_peering               = true
  lpg_peering_ocid                   = local.peering_prod_hub_lpg_ocid
  attach_routetable_to_lpg           = false
  lpg_route_table_ocid               = null
  local_peering_gateway_display_name = var.nprd_jde_vcn_to_prod_hub_vcn_lpg_display_name
}

# ----------------------------------------
# VCN Security List Module
# ----------------------------------------

module "nprd_jde_security_lists" {
  source                     = "./private_security_list_module"
  for_each                   = local.security_list_configs
  compartment_ocid           = local.compartment_ocid
  definedTags                = local.environment_project_tag[each.value.environment].definedTags
  freeformTags               = local.environment_project_tag[each.value.environment].freeformTags
  security_list_display_name = "${local.prefix}_nprd_${each.value.environment}_jde_${each.value.sl_name}_sl"
  destination_security_rules = each.value.rules.destination_rules
  source_security_rules      = each.value.rules.source_rules
  vcn_ocid                   = module.vcn_nprd_jde.vcn_ocid
}






module "nprd_vcn_jde_ldap_securitylist" {
  source                     = "./private_security_list_module"
  compartment_ocid           = local.compartment_ocid
  definedTags                = var.project_tag.definedTags
  freeformTags               = var.project_tag.freeformTags
  security_list_display_name = var.nprd_vcn_jde_ldap_securitylist_display_name
  destination_security_rules = local.nprd_vcn_jde_ldap_destination_security_rules
  source_security_rules      = local.nprd_vcn_jde_ldap_source_security_rules
  vcn_ocid                   = module.vcn_nprd_jde.vcn_ocid
}
# ----------------------------------------
# VCN Route table Module
# ----------------------------------------

module "nprd_jde_routetables" {
  source                   = "./private_route_table_module"
  for_each                 = local.route_rule_configs
  compartment_ocid         = local.compartment_ocid
  definedTags              = local.environment_project_tag[each.value.environment].definedTags
  freeformTags             = local.environment_project_tag[each.value.environment].freeformTags
  route_table_display_name = "${local.prefix}_nprd_${each.value.environment}_jde_${each.value.rt_name}_rt"
  vcn_ocid                 = module.vcn_nprd_jde.vcn_ocid
  route_rules              = each.value.rules
}



module "nprd_vcn_jde_ldap_routetable" {
  source                   = "./private_route_table_module"
  compartment_ocid         = local.compartment_ocid
  definedTags              = var.project_tag.definedTags
  freeformTags             = var.project_tag.freeformTags
  route_table_display_name = var.nprd_vcn_jde_ldap_routetable_display_name
  vcn_ocid                 = module.vcn_nprd_jde.vcn_ocid
  route_rules              = local.nprd_vcn_jde_ldap_routetable_route_rules
}


# ----------------------------------------
# VCN Subnet Module
# ----------------------------------------

module "nprd_jde_subnets" {
  source                                = "./subnet_module"
  for_each                              = local.subnet_configs
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = local.environment_project_tag[each.value.environment].definedTags
  freeformTags                          = local.environment_project_tag[each.value.environment].freeformTags
  vcn_subnet_display_name               = "${local.prefix}_nprd_${each.value.environment}_jde_${each.value.subnet_name}_sn"
  vcn_subnet_dns_label                  = each.value.dns_label
  vcn_subnet_cidr_block                 = each.value.cidr_block
  route_table_ocid                      = module.nprd_jde_routetables[each.key].route_table_ocid
  vcn_ocid                              = module.vcn_nprd_jde.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = each.value.prohibit_internet_ingress
  vcn_subnet_prohibit_public_ip_on_vnic = each.value.prohibit_public_ip_on_vnic
  dhcp_options_ocid                     = module.vcn_nprd_jde.default_dhcp_options_ocid
  security_list_ocid                    = module.nprd_jde_security_lists[each.key].security_list_ocid
}





module "jde_ldap_subnet" {
  source                                = "./subnet_module"
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = var.project_tag.definedTags
  freeformTags                          = var.project_tag.freeformTags
  vcn_subnet_display_name               = var.sn_nprd_jde_ldap_display_name
  vcn_subnet_dns_label                  = var.sn_nprd_jde_ldap_dns_label
  vcn_subnet_cidr_block                 = var.sn_nprd_jde_ldap_cidr_block
  route_table_ocid                      = module.nprd_vcn_jde_ldap_routetable.route_table_ocid
  vcn_ocid                              = module.vcn_nprd_jde.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = var.sn_nprd_jde_ldap_prohibit_internet_ingress
  vcn_subnet_prohibit_public_ip_on_vnic = var.sn_nprd_jde_ldap_prohibit_public_ip_on_vnic
  dhcp_options_ocid                     = module.vcn_nprd_jde.default_dhcp_options_ocid
  security_list_ocid                    = module.nprd_vcn_jde_ldap_securitylist.security_list_ocid
}
