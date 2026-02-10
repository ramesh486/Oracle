# ----------------------------------------
# Prod NonJDE VCN Module
# ----------------------------------------

module "vcn_prod_nonjde" {
  source           = "../terraform-networking-modules/vcn_module"
  compartment_ocid = local.compartment_ocid
  vcn_display_name = var.new_drm_vcn_prod_nonjde_display_name
  vcn_dns_label    = var.new_drm_vcn_prod_nonjde_dns_label
  vcn_cidr_block   = var.new_drm_vcn_prod_nonjde_cidr_block
  definedTags      = var.project_tag.definedTags
  freeformTags     = var.project_tag.freeformTags
}

# ----------------------------------------
# Service Gateway Module
# ----------------------------------------
module "vcn_prod_nonjde_servicegateway_private" {
  source                 = "../terraform-networking-modules/service_gw_module"
  compartment_ocid       = local.compartment_ocid
  definedTags            = var.project_tag.definedTags
  freeformTags           = var.project_tag.freeformTags
  vcn_ocid               = module.vcn_prod_nonjde.vcn_ocid
  servicegw_display_name = var.new_drm_vcn_prod_nonjde_servicegateway_private_display_name
}




# ----------------------------------------
# DRG Attachment Module
# ----------------------------------------

module "vcn_prod_nonjde_drg_attachment" {
  source                               = "../terraform-networking-modules/drg_attachments"
  compartment_ocid                     = local.compartment_ocid
  definedTags                          = var.project_tag.definedTags
  freeformTags                         = var.project_tag.freeformTags
  vcn_ocid                             = module.vcn_prod_nonjde.vcn_ocid
  drg_ocid                             = local.drg_ocid
  drg_route_table_ocid                 = local.spoke_vcn_drg_route_table_ocid
  oci_core_drg_attachment_display_name = var.new_drm_vcn_prod_nonjde_drg_attachment_display_name
}


# ----------------------------------------
# VCN SUBNET Modules
# ----------------------------------------


module "subnets" {
  source   = "../terraform-networking-modules/subnet_module"
  compartment_ocid                      = local.compartment_ocid
  definedTags                           = var.project_tag.definedTags
  freeformTags                          = var.project_tag.freeformTags
  vcn_subnet_display_name               = var.new_drm_sn_prod_nonjde_display_name
  vcn_subnet_dns_label                  = var.new_drm_sn_prod_nonjde_dns_label
  vcn_subnet_cidr_block                 = var.new_drm_sn_prod_nonjde_cidr_block
  route_table_ocid                      = module.route_tables.route_table_ocid
  vcn_ocid                              = module.vcn_prod_nonjde.vcn_ocid
  vcn_subnet_prohibit_internet_ingress  = true
  vcn_subnet_prohibit_public_ip_on_vnic = true
  dhcp_options_ocid                     = module.vcn_prod_nonjde.default_dhcp_options_ocid
  security_list_ocid                    = module.security_lists.security_list_ocid
}

# ----------------------------------------
# VCN Security List Modules
# ----------------------------------------

module "security_lists" {
  source   = "../terraform-networking-modules/private_security_list_module"
  compartment_ocid           = local.compartment_ocid
  definedTags                = var.project_tag.definedTags
  freeformTags               = var.project_tag.freeformTags
  security_list_display_name = var.new_drm_vcn_prod_nonjde_securitylist_display_name
  destination_security_rules = local.vcn_prod_nonjde_destination_security_rules
  source_security_rules      = local.vcn_prod_nonjde_source_security_rules
  vcn_ocid                   = module.vcn_prod_nonjde.vcn_ocid
}

# ----------------------------------------
# VCN Route Table Modules
# ----------------------------------------


module "route_tables" {
  source   = "../terraform-networking-modules/private_route_table_module"
  compartment_ocid         = local.compartment_ocid
  definedTags              = var.project_tag.definedTags
  freeformTags             = var.project_tag.freeformTags
  route_table_display_name = var.new_drm_vcn_prod_nonjde_routetable_private_display_name
  vcn_ocid                 = module.vcn_prod_nonjde.vcn_ocid
  route_rules              = local.vcn_prod_nonjde_routetable_private_route_rules
}




