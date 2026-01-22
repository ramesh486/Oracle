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
  default     = "qco-prod-network"
  description = "Compartment Name to deploy the VCN"
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
# Prod JDE VCN Variables
# ----------------------------------------

variable "vcn_prod_jde_ua1_display_name" {
  type        = string
  description = "Prod JDE VCN Display Name"
  default     = "qco-ua1-prod-jde-vcn"
}

variable "vcn_prod_jde_ua1_dns_label" {
  type        = string
  description = "Prod JDE VCN DNS Label"
  default     = "prodjdevcnua1"
}

variable "vcn_prod_jde_ua1_cidr_block" {
  description = "Prod JDE VCN Cidr Block"
  type        = string
  default     = "10.241.16.0/20"
}

variable "prd_hub_vcn_cidr_block" {
  type        = string
  description = "HUB VCN Cidr Block"
  default     = "10.241.112.0/23"
}


variable "prod_jde_exadata_vcn_cidr_block" {
  type        = string
  description = "Prod JDE Exadata VCN Cidr Block"
  default     = "10.241.120.0/21"
}

variable "onprem_route" {
  type        = string
  description = "OnPrem Route Cidr Block"
  default     = "10.0.0.0/8"

}

# ----------------------------------------
# Prod JDE VCN Subnet Variables
# ----------------------------------------

######## Prod JDE LB Subnet Configuration Variables

variable "sn_prod_jde_lb_display_name" {
  type        = string
  description = "Prod JDE LB Subnet Display Name"
  default     = "qco-ua1-prod-jde-lb-sn"
}

variable "sn_prod_jde_lb_dns_label" {
  type        = string
  description = "Prod JDE LB Subnet DNS Label"
  default     = "jdelbsn"
}

variable "sn_prod_jde_lb_cidr_block" {
  type        = string
  description = "Prod JDE LB Subnet Cidr Block"
  default     = "10.241.18.0/24"
}

variable "sn_prod_jde_lb_prohibit_internet_ingress" {
  type        = bool
  description = "Prod JDE LB Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_prod_jde_lb_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod JDE LB Subnet Access Type (Private or Public) "
  default     = true
}

######## Prod JDE APP Subnet Configuration Variables ############

variable "sn_prod_jde_app_display_name" {
  type        = string
  description = "Prod JDE APP Subnet Display Name"
  default     = "qco-ua1-prod-jde-app-sn"
}

variable "sn_prod_jde_app_dns_label" {
  type        = string
  description = "Prod JDE APP Subnet DNS Label"
  default     = "jdeappsn"
}

variable "sn_prod_jde_app_cidr_block" {
  type        = string
  description = "Prod JDE APP Subnet Cidr Block"
  default     = "10.241.20.0/24"
}

variable "sn_prod_jde_app_prohibit_internet_ingress" {
  type        = bool
  description = "Prod JDE APP Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_prod_jde_app_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod JDE APP Subnet Access Type (Private or Public)"
  default     = true
}

############## Prod JDE WEB Subnet Configuration Variables #######

variable "sn_prod_jde_web_display_name" {
  type        = string
  description = "Prod JDE WEB Subnet Display Name"
  default     = "qco-ua1-prod-jde-web-sn"
}

variable "sn_prod_jde_web_dns_label" {
  type        = string
  description = "Prod JDE WEB Subnet DNS Label"
  default     = "jdewebsn"
}

variable "sn_prod_jde_web_cidr_block" {
  type        = string
  description = "Prod JDE WEB Subnet Cidr Block"
  default     = "10.241.19.0/24"
}

variable "sn_prod_jde_web_prohibit_internet_ingress" {
  type        = bool
  description = "Prod JDE WEB Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_prod_jde_web_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod JDE WEB Subnet Access Type (Private or Public)"
  default     = true
}

########## Prod JDE Admin Subnet Configuration Variables ############

variable "sn_prod_jde_admin_display_name" {
  type        = string
  description = "Prod JDE Admin Subnet Display Name"
  default     = "qco-ua1-prod-jde-admin-sn"
}

variable "sn_prod_jde_admin_dns_label" {
  type        = string
  description = "Prod JDE Admin Subnet DNS Label"
  default     = "jdeadminsn"
}

variable "sn_prod_jde_admin_cidr_block" {
  type        = string
  description = "Prod JDE Admin Subnet Cidr Block"
  default     = "10.241.16.0/24"
}

variable "sn_prod_jde_admin_cidr_block_prohibit_internet_ingress" {
  type        = bool
  description = "Prod JDE Admin Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_prod_jde_admin_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod JDE Admin Subnet Access Type (Private or Public)"
  default     = true
}


# ########## Prod JDE LDAP Subnet Configuration Variables ############

variable "sn_prod_jde_ldap_display_name" {
  type        = string
  description = "Prod JDE LDAP Subnet Display Name"
  default     = "qco-ua1-prod-jde-ldap-sn"
}

variable "sn_prod_jde_ldap_dns_label" {
  type        = string
  description = "Prod JDE LDAP Subnet DNS Label"
  default     = "jdeldapsn"
}

variable "sn_prod_jde_ldap_cidr_block" {
  type        = string
  description = "Prod JDE LDAP Subnet Cidr Block"
  default     = "10.241.17.0/24"
}

variable "sn_prod_jde_ldap_prohibit_internet_ingress" {
  type        = bool
  description = "Prod JDE LDAP Subnet Access Type (Private or Public)"
  default     = true
}

variable "sn_prod_jde_ldap_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prod JDE LDAP Subnet Access Type (Private or Public)"
  default     = true
}



# ----------------------------------------
# VCN Route Table Variables
# ----------------------------------------

variable "vcn_prod_jde_ua1_routetable_private_lb_display_name" {
  type        = string
  description = "Prod JDE VCN LB Route Table"
  default     = "qco-ua1-prod-jde-lb-rt"
}

variable "vcn_prod_jde_ua1_routetable_private_web_display_name" {
  type        = string
  description = "Prod JDE VCN WEB Route Table"
  default     = "qco-ua1-prod-jde-web-rt"
}

variable "vcn_prod_jde_ua1_routetable_private_app_display_name" {
  type        = string
  description = "Prod JDE VCN APP Route Table"
  default     = "qco-ua1-prod-jde-app-rt"
}

variable "vcn_prod_jde_ua1_routetable_private_admin_display_name" {
  type        = string
  description = "Prod JDE VCN Admin Route Table"
  default     = "qco-ua1-prod-jde-admin-rt"
}

variable "vcn_prod_jde_ua1_routetable_private_ldap_display_name" {
  type        = string
  description = "Prod JDE VCN LDAP Route Table"
  default     = "qco-ua1-prod-jde-ldap-rt"
}


# ----------------------------------------
# DRG Variables
# ----------------------------------------

variable "drg_display_name" {
  type        = string
  description = "DRG Display Name"
  default     = "qco-ua1-prod-drg"

}

variable "vcn_prod_jde_ua1_drg_attachment_display_name" {
  type        = string
  description = "Prod DRG Attachment Display Name"
  default     = "qco-ua1-prod-jde-vcn-drg-attachment"
}


variable "spoke_vcn_drg_route_table_display_name" {
  type        = string
  description = "Spoke VCN DRG Route Table Display Name"
  default     = "qco-ua1-prod-spoke-vcn-drg-route-table"
}

variable "route_to_exadata_vcn_using_drg" {
  type        = bool
  description = "Route to Exadata VCN using DRG"
  default     = false
}


variable "prod_exadata_vcn_to_prod_jde_vcn_lpg_display_name" {
  type        = string
  description = "Prod Exadata VCN to Prod JDE VCN LPG Display Name"
  default     = "qco-ua1-prod-exadata-vcn-to-prod-jde-vcn-lpg"
}

variable "prod_jde_vcn_to_prod_hub_vcn_lpg_display_name" {
  type        = string
  description = "Prod JDE VCN to Prod Hub VCN LPG Display Name"
  default     = "qco-ua1-prod-jde-vcn-to-prod-hub-vcn-lpg"
}

variable "prod_jde_vcn_to_prod_exadata_vcn_lpg_display_name" {
  type        = string
  description = "Prod JDE VCN to Prod Exadata VCN LPG Display Name"
  default     = "qco-ua1-prod-jde-vcn-to-prod-exadata-vcn-lpg"
}

variable "prod_hub_vcn_to_prod_jde_vcn_lpg_display_name" {
  type        = string
  description = "Prod Hub VCN to Prod JDE VCN LPG Display Name"
  default     = "qco-ua1-prod-hub-vcn-to-prod-jde-vcn-lpg"
}

# ----------------------------------------
# Security List Variables
# ----------------------------------------

variable "vcn_prod_jde_ua1_lb_securitylist_display_name" {
  type        = string
  description = "Prod JDE VCN Private LB Subnet Security List Display Name"
  default     = "qco-ua1-prod-jde-lb-sl"
}

variable "vcn_prod_jde_ua1_lb_securitylist_is_stateless" {
  type        = bool
  description = "Prod JDE VCN Private LB Subnet Security List is Stateless?"
  default     = false
}



variable "vcn_prod_jde_ua1_web_securitylist_display_name" {
  type        = string
  description = "Prod JDE VCN Private Web Subnet Security List Display Name"
  default     = "qco-ua1-prod-jde-web-sl"
}

variable "vcn_prod_jde_ua1_web_securitylist_is_stateless" {
  type        = bool
  description = "Prod JDE VCN Private Web Subnet Security List is Stateless?"
  default     = false
}



variable "vcn_prod_jde_ua1_app_securitylist_display_name" {
  type        = string
  description = "Prod JDE VCN Private App Subnet Security List Display Name"
  default     = "qco-ua1-prod-jde-app-sl"
}

variable "vcn_prod_jde_ua1_app_securitylist_is_stateless" {
  type        = bool
  description = "Prod JDE VCN Private App Subnet Security List is Stateless?"
  default     = false
}


variable "vcn_prod_jde_ua1_admin_securitylist_display_name" {
  type        = string
  description = "Prod JDE VCN Admin Subnet Security List Display Name"
  default     = "qco-ua1-prod-jde-admin-sl"
}

variable "vcn_prod_jde_ua1_admin_securitylist_is_stateless" {
  type        = bool
  description = "Prod JDE VCN Admin Subnet Security List is Stateless?"
  default     = false
}

variable "vcn_prod_jde_ua1_ldap_securitylist_display_name" {
  type        = string
  description = "Prod JDE VCN LDAP Subnet Security List Display Name"
  default     = "qco-ua1-prod-jde-ldap-sl"
}

variable "vcn_prod_jde_ua1_ldap_securitylist_is_stateless" {
  type        = bool
  description = "Prod JDE VCN LDAP Subnet Security List is Stateless?"
  default     = false
}



# ----------------------------------------
# VCN Components Variables
# ----------------------------------------


variable "vcn_prod_jde_ua1_servicegateway_private_display_name" {
  type        = string
  description = "Prod JDE VCN Service Gateway Display Name"
  default     = "qco-ua1-prod-jde-servicegateway-private"
}

variable "vcn_prod_jde_ua1_natgateway_display_name" {
  type        = string
  description = "Prod JDE VCN NAT Gateway Display Name"
  default     = "qco-ua1-prod-jde-natgateway"
}

variable "vcn_prod_jde_ua1_natgateway_block_traffic" {
  type        = bool
  description = "Block the traffic in NAT gateway on creation"
  default     = false
}

variable "vcn_prod_jde_ua1_natgateway_public_ip_lifetime" {
  type        = string
  description = "Reserved IP Address will be created for NAT Gateway"
  default     = "RESERVED"
}
