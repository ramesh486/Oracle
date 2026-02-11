# ----------------------------------------
# Common Variables
# ----------------------------------------

variable "tenancy_ocid" {
  description = "Target tenancy OCID"
  type        = string
  default     = ""
}

variable "user_ocid" {
  type        = string
  default     = ""
  description = "User ID to deploy the VCN"
}

variable "fingerprint" {
  type        = string
  default     = ""
  description = "fingerprint to deploy the VCN"
}

variable "api_private_key" {
  type        = string
  default     = ""
  description = "private key to deploy the VCN"
}


variable "compartment_name" {
  type        = string
  default     = "qco-prod-network"
  description = "Compartment Name to deploy the VCN"
}

variable "hub_compartment_name" {
  type        = string
  default     = "qco-hub-network"
  description = "Hub Compartment Name"
}

variable "compartment_id_in_subtree" {
  type        = bool
  default     = true
  description = "Compartment ID in Subtree"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-ashburn-1"
}

variable "project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}

# ----------------------------------------
# Prod NONJDE NEW DRM VCN Variables
# ----------------------------------------

variable "new_drm_vcn_prod_nonjde_display_name" {
  type        = string
  description = "Prod NONJDE NEW DRM VCN Display Name"
  default     = "qco-uas1-prod-nonjde-new-drm-vcn"
}

variable "new_drm_vcn_prod_nonjde_dns_label" {
  type        = string
  description = "Prod NONJDE NEW DRM VCN DNS Label"
  default     = "newdrmvcn"
}

variable "new_drm_vcn_prod_nonjde_cidr_block" {
  description = "Prod NONJDE NEW DRM VCN Cidr Block"
  type        = string
  default     = "10.241.42.0/25"
}

variable "prd_hub_vcn_cidr_block" {
  type        = string
  description = "HUB VCN Cidr Block"
  default     = "10.241.112.0/23"
}

variable "onprem_route" {
  type        = string
  description = "OnPrem Route Cidr Block"
  default     = "10.0.0.0/8"

}

# ----------------------------------------
# Prod NONJDE Subnet Variables
# ----------------------------------------

variable "new_drm_sn_prod_nonjde_display_name" {
  type        = string
  description = "Prod NONJDE New drm Subnet Display Name"
  default     = "qco-uas1-prod-nonjde-new-drm-sn"
}

variable "new_drm_sn_prod_nonjde_dns_label" {
  type        = string
  description = "Prod NONJDE New drm Subnet DNS Label"
  default     = "newdrmsn"
}

variable "new_drm_sn_prod_nonjde_cidr_block" {
  type        = string
  description = "Prod NONJDE New drm Subnet Cidr Block"
  default     = "10.241.42.0/26"
}

variable "sn_prod_nonjde_prohibit_internet_ingress" {
  type        = bool
  description = "Prod NONJDE Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_prod_nonjde_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod NONJDE Subnet Access Type (Private or Public) "
  default     = true
}

variable "sn_prod_nonjde_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}


# ----------------------------------------
# VCN Prod NONJDE Components Variables
# ----------------------------------------

variable "new_drm_vcn_prod_nonjde_servicegateway_private_display_name" {
  type        = string
  description = "Prod NONJDE VCN Service Gateway Display Name"
  default     = "qco-uas1-prod-nonjde-new-drm-servicegateway"
}


# ----------------------------------------
# VCN Route Table Variables
# ----------------------------------------

variable "new_drm_vcn_prod_nonjde_routetable_private_display_name" {
  type        = string
  description = "Prod NONJDE VCN Route Table"
  default     = "qco-uas1-prod-nonjde-new-drm-private-rt"
}


# ----------------------------------------
# DRG Variables
# ----------------------------------------

variable "drg_display_name" {
  type        = string
  description = "DRG Display Name"
  default     = "qco-ua1-prod-drg"
}

variable "new_drm_vcn_prod_nonjde_drg_attachment_display_name" {
  type        = string
  description = "Prod NONJDE DRG Attachment Display Name"
  default     = "qco-uas1-prod-nonjde-new-drm-vcn-drg-attachment"
}

variable "spoke_vcn_drg_route_table_display_name" {
  type        = string
  description = "Spoke VCN DRG Route Table Display Name"
  default     = "qco-ua1-prod-spoke-vcn-drg-route-table"
}


# ----------------------------------------
# Security List Variables
# ----------------------------------------

variable "new_drm_vcn_prod_nonjde_securitylist_display_name" {
  type        = string
  description = "Prod NONJDE VCN Private Subnet Security List Display Name"
  default     = "qco-uas1-prod-nonjde-new-drm-sl"
}

variable "new_drm_vcn_prod_nonjde_securitylist_is_stateless" {
  type        = bool
  description = "Prod NONJDE VCN Private Subnet Security List is Stateless?"
  default     = false
}



