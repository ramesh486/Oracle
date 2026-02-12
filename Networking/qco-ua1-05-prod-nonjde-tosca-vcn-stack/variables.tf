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
# NONJDE TOSCA VCN Variables
# ----------------------------------------

variable "tosca_vcn_nonjde_display_name" {
  type        = string
  description = "NONJDE TOSCA VCN Display Name"
  default     = "qco-uas1-nonjde-tosca-vcn"
}

variable "tosca_vcn_nonjde_dns_label" {
  type        = string
  description = "NONJDE TOSCA VCN DNS Label"
  default     = "toscavcn1"
}

variable "tosca_vcn_nonjde_cidr_block" {
  description = "NONJDE TOSCA VCN Cidr Block"
  type        = string
  default     = "10.241.44.0/25"
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
# NONJDE TOSCA Subnet Variables
# ----------------------------------------

variable "tosca_sn_nonjde_display_name" {
  type        = string
  description = "NONJDE TOSCA Subnet Display Name"
  default     = "qco-uas1-nonjde-tosca-sn"
}

variable "tosca_sn_nonjde_dns_label" {
  type        = string
  description = "NONJDE TOSCA Subnet DNS Label"
  default     = "toscasn"
}

variable "tosca_sn_nonjde_cidr_block" {
  type        = string
  description = "NONJDE TOSCA Subnet Cidr Block"
  default     = "10.241.44.0/26"
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
# TOSCA VCN NONJDE Components Variables
# ----------------------------------------

variable "tosca_vcn_nonjde_servicegateway_private_display_name" {
  type        = string
  description = "NONJDE TOSCA VCN Service Gateway Display Name"
  default     = "qco-uas1-nonjde-tosca-servicegateway"
}


# ----------------------------------------
# TOSCA VCN Route Table Variables
# ----------------------------------------

variable "tosca_vcn_nonjde_routetable_private_display_name" {
  type        = string
  description = "NONJDE TOSCA VCN Route Table"
  default     = "qco-uas1-nonjde-tosca-private-rt"
}


# ----------------------------------------
# DRG Variables
# ----------------------------------------

variable "drg_display_name" {
  type        = string
  description = "DRG Display Name"
  default     = "qco-uas1-prod-drg"
}

variable "tosca_vcn_nonjde_drg_attachment_display_name" {
  type        = string
  description = "NONJDE TOSCA VCN DRG Attachment Display Name"
  default     = "qco-uas1-nonjde-tosca-vcn-drg-attachment"
}

variable "spoke_vcn_drg_route_table_display_name" {
  type        = string
  description = "Spoke VCN DRG Route Table Display Name"
  default     = "qco-uas1-prod-spoke-vcn-drg-route-table"
}


# ----------------------------------------
# Security List Variables
# ----------------------------------------

variable "tosca_vcn_nonjde_securitylist_display_name" {
  type        = string
  description = "NONJDE TOSCA VCN Private Subnet Security List Display Name"
  default     = "qco-uas1-nonjde-tosca-sl"
}

variable "tosca_vcn_nonjde_securitylist_is_stateless" {
  type        = bool
  description = "NONJDE TOSCA VCN Private Subnet Security List is Stateless?"
  default     = false
}



