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
  default     = "qco-shared-services"
  description = "Compartment Name to deploy the VCN"
}

variable "hub_compartment_name" {
  type        = string
  default     = "qco-hub-network"
  description = "Hub Compartment Name"
}

variable "prod_compartment_name" {
  type        = string
  default     = "qco-prod-network"
  description = "Prod Compartment Name"
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
# NONJDE OEM VCN Variables
# ----------------------------------------

variable "oem_vcn_nonjde_display_name" {
  type        = string
  description = "NONJDE OEM VCN Display Name"
  default     = "qco-uas1-nonjde-oem-vcn"
}

variable "oem_vcn_nonjde_dns_label" {
  type        = string
  description = "NONJDE OEM VCN DNS Label"
  default     = "oemvcn"
}

variable "oem_vcn_nonjde_cidr_block" {
  description = "NONJDE OEM VCN Cidr Block"
  type        = string
  default     = "10.241.44.128/25"
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
# NONJDE OEM Subnet Variables
# ----------------------------------------

variable "oem_sn_nonjde_display_name" {
  type        = string
  description = "NONJDE OEM Subnet Display Name"
  default     = "qco-uas1-nonjde-oem-sn"
}

variable "oem_sn_nonjde_dns_label" {
  type        = string
  description = "NONJDE OEM Subnet DNS Label"
  default     = "oemsn"
}

variable "oem_sn_nonjde_cidr_block" {
  type        = string
  description = "NONJDE OEM Subnet Cidr Block"
  default     = "10.241.44.128/26"
}

variable "sn_nonjde_prohibit_internet_ingress" {
  type        = bool
  description = "NONJDE Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_nonjde_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "NONJDE Subnet Access Type (Private or Public) "
  default     = true
}

variable "sn_nonjde_project_tag" {
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}


# ----------------------------------------
# VCN NONJDE Components Variables
# ----------------------------------------

variable "oem_vcn_nonjde_servicegateway_private_display_name" {
  type        = string
  description = "NONJDE OEM VCN Service Gateway Display Name"
  default     = "qco-uas1-nonjde-oem-servicegateway"
}


# ----------------------------------------
# VCN Route Table Variables
# ----------------------------------------

variable "oem_vcn_nonjde_routetable_private_display_name" {
  type        = string
  description = "NONJDE OEM VCN Route Table"
  default     = "qco-uas1-nonjde-oem-private-rt"
}


# ----------------------------------------
# DRG Variables
# ----------------------------------------

variable "drg_display_name" {
  type        = string
  description = "DRG Display Name"
  default     = "qco-uas1-prod-drg"
}

variable "oem_vcn_nonjde_drg_attachment_display_name" {
  type        = string
  description = "NONJDE OEM DRG Attachment Display Name"
  default     = "qco-uas1-nonjde-oem-vcn-drg-attachment"
}

variable "spoke_vcn_drg_route_table_display_name" {
  type        = string
  description = "Spoke VCN DRG Route Table Display Name"
  default     = "qco-uas1-prod-spoke-vcn-drg-route-table"
}


# ----------------------------------------
# Security List Variables
# ----------------------------------------

variable "oem_vcn_nonjde_securitylist_display_name" {
  type        = string
  description = "NONJDE OEM VCN Private Subnet Security List Display Name"
  default     = "qco-uas1-nonjde-oem-sl"
}

variable "oem_vcn_nonjde_securitylist_is_stateless" {
  type        = bool
  description = "NONJDE VCN Private Subnet Security List is Stateless?"
  default     = false
}



