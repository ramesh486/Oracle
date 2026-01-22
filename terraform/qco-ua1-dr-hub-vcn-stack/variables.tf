# ----------------------------------------
# Common Variables
# ----------------------------------------

variable "tenancy_ocid" {
  description = "Target tenancy OCID"
  type        = string
  default     = ""
}

variable "user_ocid"{
    type = string
    default =  ""
    description = "User ID to deploy the VCN"    
}

variable "fingerprint"{
    type = string
    default =  ""
    description = "fingerprint to deploy the VCN"    
}

variable "api_private_key"{
    type = string
    default =  ""
    description = "private key to deploy the VCN"    
}

variable "compartment_name" {
    type = string
    default = "qco-dr-network"
    description = "Compartment Name to deploy the VCN"
}

variable "compartment_id_in_subtree" {
    type = bool
    default = true
    description = "Compartment ID in Subtree"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-ashburn-1"
}

variable "project_tag" {
  type        = map
  description = "Tags to be assigned to resources created by terraform"
  default = {
      definedTags = {}
      freeformTags = {}
  }
}

# ----------------------------------------
# VCN Variables
# ----------------------------------------

variable "vcn_prod_hub_jde_uas2_display_name" {
  type        = string
  description = "Prod HUB VCN Display Name"
  default     = "vcn-prod-hub-jde-uas2"
}

variable "vcn_prod_hub_jde_uas2_dns_label" {
  type        = string
  description = "Prod HUB VCN DNS Label"
  default     = "prodhubjdeuas2"
}

variable "vcn_prod_hub_jde_uas2_cidr_block" {
  description = "Prod HUB VCN Cidr Block"
  type        = string
  default     = "20.20.0.0/16"
}

# ----------------------------------------
# Subnet Variables
# ----------------------------------------
# ----------------------------------------
# Prod HA Private Subnet Configuration Variables
# ----------------------------------------


variable "prod_ha_private_subnet_display_name" {
  type        = string
  description = "Prod HA Private Subnet Display Name"
  default     = "sn-prod-hub-ha-uas2"
}

variable "prod_ha_private_subnet_dns_label" {
  type        = string
  description = "Prod HA Private Subnet DNS Label"
  default     = "prodhubhauas2"
}

variable "prod_ha_private_subnet_cidr_block" {
  type        = string
  description = "Prod HA Private Subnet Cidr Block"
  default     = "20.20.0.0/24"
}

variable "prod_ha_private_subnet_prohibit_internet_ingress" {
  type        = bool
  description = "Prod HA Private Subnet Access Type (Private or Public)"
  default     = true
}

variable "prod_ha_private_subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod HA Private Subnet Access Type (Private or Public)"
  default     = true
}

variable "prod_ha_private_subnet_project_tag" {
  type        = map
  description = "Tags to be assigned to resources created by terraform"
  default = {
      definedTags = {}
      freeformTags = {}
  }
}

# -------------------------------------------------
# Prod Untrust Subnet Configuration Variables
# -------------------------------------------------



variable "prod_untrust_subnet_display_name" {
  type        = string
  description = "Prod Untrust Subnet Display Name"
  default     = "sn-prod-hub-untrust-uas2"
}

variable "prod_untrust_subnet_dns_label" {
  type        = string
  description = "Prod Untrust Subnet DNS Label" 
  default     = "untrustuas2"
}

variable "prod_untrust_subnet_cidr_block" {
  type        = string
  description = "Prod Untrust Subnet Cidr Block"
  default     = "20.20.1.0/24"
}

variable "prod_untrust_subnet_prohibit_internet_ingress" {
  type        = bool
  description = "Prod Untrust Subnet Access Type (Private or Public)"
  default     = false
}

variable "prod_untrust_subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod Untrust Subnet Access Type (Private or Public) "
  default     = false
}

variable "prod_untrust_project_tag" {
  type        = map
  description = "Tags to be assigned to resources created by terraform"
  default = {
      definedTags = {}
      freeformTags = {}
  }
}


# ----------------------------------------
# Prod Management Subnet Configuration Variables
# ----------------------------------------


variable "prod_management_subnet_display_name" {
  type        = string
  description = "Prod Management Subnet Display Name"
  default     = "sn-prod-hub-mgmt-uas2"
}

variable "prod_management_subnet_dns_label" {
  type        = string
  description = "Prod Management Subnet DNS Label"
  default     = "prodhubmgmtuas2"
}

variable "prod_management_subnet_cidr_block" {
  type        = string
  description = "Prod Management Subnet Cidr Block"
  default     = "20.20.2.0/24"
}

variable "prod_management_subnet_prohibit_internet_ingress" {
  type        = bool
  description = "Prod Management Subnet Access Type (Private or Public)"
  default     = true
}

variable "prod_management_subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod Management Subnet Access Type (Private or Public)"
  default     = true
}

variable "prod_management_project_tag" {
  type        = map
  description = "Tags to be assigned to resources created by terraform"
  default = {
      definedTags = {}
      freeformTags = {}
  }
}


# ----------------------------------------
# Prod Trust Subnet Configuration Variables
# ----------------------------------------


variable "prod_trust_subnet_display_name" {
  type        = string
  description = "Prod Trust Subnet Display Name"
  default     = "sn-prod-hub-trust-uas2"
}

variable "prod_trust_subnet_dns_label" {
  type        = string
  description = "Prod Trust Subnet DNS Label"
  default     = "hubtrustuas2"
}

variable "prod_trust_subnet_cidr_block" {
  type        = string
  description = "Prod Trust Subnet Cidr Block"
  default     = "20.20.3.0/24"
}

variable "prod_trust_subnet_prohibit_internet_ingress" {
  type        = bool
  description = "Prod Trust Subnet Access Type (Private or Public)"
  default     = true
}

variable "prod_trust_subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod Trust Subnet Access Type (Private or Public)"
  default     = true
}

variable "prod_trust_project_tag" {
  type        = map
  description = "Tags to be assigned to resources created by terraform"
  default = {
      definedTags = {}
      freeformTags = {}
  }
}

# ----------------------------------------
# VCN Components Variables
# ----------------------------------------


variable "vcn_prod_hub_jde_uas2_servicegateway_private_display_name" {
  type        = string
  description = "Prod HUB VCN Service Gateway Display Name"
  default     = "vcn-prod-hub-jde-uas2-servicegateway-private"
}

variable "vcn_prod_hub_jde_uas2_natgateway_display_name" {
  type        = string
  description = "Prod HUB VCN NAT Gateway Display Name"
  default     = "vcn-prod-hub-jde-uas2-natgateway"
}

variable "vcn_prod_hub_jde_uas2_natgateway_block_traffic" {
  type        = bool
  description = "Block the traffic in NAT gateway on creation"
  default     = false
}

variable "vcn_prod_hub_jde_uas2_natgateway_public_ip_lifetime" {
  type        = string
  description = "Reserved IP Address will be created for NAT Gateway"
  default     = "RESERVED"
}
variable "vcn_prod_hub_jde_uas2_intgw_display_name" {
   type        = string
  description = "Prod HUB VCN Internet Gateway Display Name"
  default = "vcn-prod-hub-jde-uas2-intgw"
}

variable "vcn_prod_hub_jde_uas2_intgw_enabled" {
  type        = bool
  description = "Is Prod HUB intgw enabled"
  default = true
}


# ----------------------------------------
# VCN Route Table Variables
# ----------------------------------------


variable "vcn_prod_hub_jde_uas2_routetable_untrust_display_name" {
  type = string
  description = "Prod HUB VCN Untrust Route Table"
  default = "vcn-prod-hub-jde-uas2-routetable-untrust"
}

variable "vcn_prod_hub_jde_uas2_routetable_private_management_display_name" {
  type = string
  description = "Prod HUB VCN Managment Route Table"
  default = "vcn-prod-hub-jde-uas2-routetable-private-management"
}

variable "vcn_prod_hub_jde_uas2_routetable_private_trust_display_name" {
  type = string
  description = "Prod HUB VCN Trust Route Table"
  default = "vcn-prod-hub-jde-uas2-routetable-private-trust"
}

variable "vcn_prod_hub_jde_uas2_routetable_private_ha_display_name" {
  type = string
  description = "Prod HUB VCN HA Private Route Table"
  default = "vcn-prod-hub-jde-uas2-routetable-private-ha"
}

# ----------------------------------------
# DRG Variables
# ----------------------------------------

variable "drg_display_name" {
  type = string
  description = "DRG Display Name"
  default = "ash-prod-drg-uas2"
}

variable "vcn_prod_hub_jde_uas2_drg_attachment_display_name" {
  type = string
  description = "Prod DRG Attachment Display Name"
  default = "vcn-prod-hub-jde-uas2-drg-attachment"
}


# ----------------------------------------
# Security List Variables
# ----------------------------------------

variable "vcn_prod_hub_jde_uas2_seclist_private_trust_display_name" {
  type = string
  description = "Prod HUB VCN trust Private Security List Display Name"
  default = "vcn-prod-hub-jde-uas2-seclist-private-trust"
}

variable "vcn_prod_hub_jde_uas2_seclist_private_ha_display_name" {
  type = string
  description = "Prod HUB VCN HA Subnet Private Security List Display Name"
  default = "vcn-prod-hub-jde-uas2-seclist-private-ha"
}

variable "vcn_prod_hub_jde_uas2_seclist_private_management_display_name" {
  type = string
  description = "Prod HUB VCN management Subnet Private Security List Display Name"
  default = "vcn-prod-hub-jde-uas2-seclist-private-management"
}

variable "vcn_prod_hub_jde_uas2_seclist_untrust_display_name" {
  type = string
  description = "Prod HUB VCN untrust Subnet Security List Display Name"
  default = "vcn-prod-hub-jde-uas2-seclist-untrust"
}


variable "vcn_prod_hub_jde_uas2_seclist_private_is_stateless" {
  type = bool
  description = "Prod HUB VCN Private Security List is Stateless?"
  default = false
}

