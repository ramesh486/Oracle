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
  type        = string
  default     = "qco-nonprod-network"
  description = "Compartment Name to deploy the DRG"
}

variable "prod_network_compatment_name" {
  type        = string
  default     = "qco-prod-network"
  description = "Compartment Name to deploy the DRG"
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
# VCN Variables
# ----------------------------------------

variable "nprd_vcn_display_name" {
  type        = string
  description = "NonProd VCN Display Name"
  default     = "qco-ua1-nprd-jde-vcn"
}

variable "nprd_vcn_dns_label" {
  type        = string
  description = "NonProd VCN DNS Label"
  default     = "nprdjdevcnua1"
}

variable "nprd_vcn_cidr_block" {
  type        = string
  description = "NonProd VCN Cidr Block"
  default     = "10.241.48.0/20"
}

variable "prd_hub_vcn_cidr_block" {
  type        = string
  description = "HUB VCN Cidr Block"
  default     = "10.241.0.0/23"
}

variable "prod_jde_exadata_vcn_cidr_block" {
  type        = string
  description = "Prod JDE Exadata VCN Cidr Block"
  default     = "10.241.8.0/21"
}

variable "onprem_route" {
  description = "Onprem Cidr Block"
  type        = string
  default     = "10.0.0.0/8"
}




# ----------------------------------------
# jde_ldap Subnet Configuration Variables
# ----------------------------------------


variable "sn_nprd_jde_ldap_display_name" {
  type        = string
  description = "nprd_jde_ldap Subnet Display Name"
  default     = "qco-ua1-nprd-jde-ldap-sn"
}

variable "sn_nprd_jde_ldap_dns_label" {
  type        = string
  description = "nprd_jde_ldap Subnet DNS Label"
  default     = "nprdjdeldapsn"
}

variable "sn_nprd_jde_ldap_cidr_block" {
  type        = string
  description = "nprd_jde_ldap Subnet Cidr Block"
  default     = "10.241.48.0/25"
}

variable "sn_nprd_jde_ldap_prohibit_internet_ingress" {
  type        = bool
  description = "nprd_jde_ldap Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_nprd_jde_ldap_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "nprd_jde_ldap Subnet Access Type (Private or Public)"
  default     = true
}

# ----------------------------------------
# VCN Components Variables
# ----------------------------------------


variable "nprd_vcn_servicegateway_private_display_name" {
  type        = string
  description = "NonProd VCN Service Gateway Display Name"
  default     = "qco-ua1-nprd-jde-servicegateway-private"
}

variable "nprd_vcn_natgateway_display_name" {
  type        = string
  description = "NonProd VCN NAT Gateway Display Name"
  default     = "qco_ua1_nprd_jde_natgateway"
}

variable "nprd_vcn_natgateway_block_traffic" {
  type        = bool
  description = "Block the traffic in NAT gateway on creation"
  default     = false
}

variable "nprd_vcn_natgateway_public_ip_lifetime" {
  type        = string
  description = "Reserved IP Address will be created for NAT Gateway"
  default     = "RESERVED"
}



# ----------------------------------------
# VCN Route Table Variables
# ----------------------------------------

variable "nprd_vcn_jde_ldap_routetable_display_name" {
  type        = string
  description = "NonProd VCN JDE LDAP Route Table"
  default     = "qco-ua1-nprd-jde-ldap-rt"
}

# ----------------------------------------
# DRG Variables
# ----------------------------------------

variable "drg_display_name" {
  type        = string
  description = "DRG Display Name"
  default     = "qco-ua1-prod-drg"
}


variable "nprd_vcn_drg_attachment_display_name" {
  type        = string
  description = "DRG Attachment Display Name"
  default     = "qco-ua1-nprd-jde-vcn-drg-attachment"
}

variable "spoke_vcn_drg_route_table_display_name" {
  type        = string
  description = "Spoke VCN DRG Route Table Display Name"
  default     = "qco-ua1-prod-spoke-vcn-drg-route-table"
}

variable "route_to_exadata_vcn_using_drg" {
  type        = bool
  description = "Route to Exadata VCN using DRG?"
  default     = true
}

# ----------------------------------------
# LPG Variables
# ----------------------------------------

variable "nprd_jde_vcn_to_exadata_vcn_lpg_display_name" {
  type        = string
  description = "JDE Nonprod VCN LPG Display Name"
  default     = "qco-ua1-nprd-jde-vcn-to-prod-exadata-vcn-lpg"
}


variable "exadata_vcn_to_nprd_jde_vcn_lpg_display_name" {
  type        = string
  description = "JDE Exadata VCN LPG Display Name"
  default     = "qco-ua1-prod-exadata-vcn-to-nprd-jde-vcn-lpg"
}

variable "nprd_jde_vcn_to_prod_hub_vcn_lpg_display_name" {
  type        = string
  description = "NPRD JDE VCN to Prod HUB VCN LPG Display Name"
  default     = "qco-ua1-nprd-jde-vcn-to-prod-hub-vcn-lpg"
}

variable "prod_hub_vcn_to_nprd_jde_vcn_lpg_display_name" {
  type        = string
  description = "Prod HUB VCN to NPRD JDE VCN LPG Display Name"
  default     = "qco-ua1-prod-hub-vcn-to-nprd-jde-vcn-lpg"
}


# ----------------------------------------
# Security List Variables
# ----------------------------------------

variable "nprd_vcn_jde_ldap_securitylist_display_name" {
  type        = string
  description = "NonProd JDE LDAP Security List Display Name"
  default     = "qco-ua1-nprd-jde-ldap-sl"
}
