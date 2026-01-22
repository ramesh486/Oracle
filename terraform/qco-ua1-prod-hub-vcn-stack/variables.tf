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
# VCN Variables
# ----------------------------------------

variable "vcn_prod_hub_display_name" {
  type        = string
  description = "Prod HUB VCN Display Name"
  default     = "qco-ua1-prod-hub-vcn"
}

variable "vcn_prod_hub_dns_label" {
  type        = string
  description = "Prod HUB VCN DNS Label"
  default     = "prodhubvcnua1"
}

variable "vcn_prod_hub_cidr_block" {
  description = "Prod HUB VCN Cidr Block"
  type        = string
  default     = "10.241.112.0/23"
}

variable "onprem_route" {
  type        = string
  default     = "10.0.0.0/8"
  description = "Onprem route to be added to route tables"
}


variable "prod_jde_vcn_cidr_block" {
  type        = string
  description = "Prod JDE VCN Cidr Block"
  default     = "10.241.16.0/20"
}

variable "nprd_jde_vcn_cidr_block" {
  type        = string
  description = "Nonprod JDE VCN Cidr Block"
  default     = "10.241.48.0/20"
}

variable "prod_exadata_jde_vcn_cidr_block" {
  type        = string
  description = "Prod Exadata JDE VCN Cidr Block"
  default     = "10.241.120.0/21"
}

variable "prod_nonjde_vcn_cidr_block" {
  type        = string
  description = "Prod NONJDE VCN Cidr Block"
  default     = "10.241.32.0/21"
}

variable "nprd_nonjde_vcn_cidr_block" {
  type        = string
  description = "Nonprod NONJDE VCN Cidr Block"
  default     = "10.241.96.0/20"
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
  default     = "qco-ua1-prod-ha-sn"
}

variable "prod_ha_private_subnet_dns_label" {
  type        = string
  description = "Prod HA Private Subnet DNS Label"
  default     = "prodhasn"
}

variable "prod_ha_private_subnet_cidr_block" {
  type        = string
  description = "Prod HA Private Subnet Cidr Block"
  default     = "10.241.112.0/25"
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
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}

# -------------------------------------------------
# Prod Untrust Subnet Configuration Variables
# -------------------------------------------------



variable "prod_untrust_subnet_display_name" {
  type        = string
  description = "Prod Untrust Subnet Display Name"
  default     = "qco-ua1-prod-untrust-sn"
}

variable "prod_untrust_subnet_dns_label" {
  type        = string
  description = "Prod Untrust Subnet DNS Label"
  default     = "produntrustsn"
}

variable "prod_untrust_subnet_cidr_block" {
  type        = string
  description = "Prod Untrust Subnet Cidr Block"
  default     = "10.241.112.128/25"
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
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}


# ----------------------------------------
# Prod Management Subnet Configuration Variables
# ----------------------------------------


variable "prod_management_subnet_display_name" {
  type        = string
  description = "Prod Management Subnet Display Name"
  default     = "qco-ua1-prod-management-sn"
}

variable "prod_management_subnet_dns_label" {
  type        = string
  description = "Prod Management Subnet DNS Label"
  default     = "prodmgmtsn"
}

variable "prod_management_subnet_cidr_block" {
  type        = string
  description = "Prod Management Subnet Cidr Block"
  default     = "10.241.113.128/25"
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
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}


# ----------------------------------------
# Prod Trust Subnet Configuration Variables
# ----------------------------------------


variable "prod_trust_subnet_display_name" {
  type        = string
  description = "Prod Trust Subnet Display Name"
  default     = "qco-ua1-prod-trust-sn"
}

variable "prod_trust_subnet_dns_label" {
  type        = string
  description = "Prod Trust Subnet DNS Label"
  default     = "prodtrustsn"
}

variable "prod_trust_subnet_cidr_block" {
  type        = string
  description = "Prod Trust Subnet Cidr Block"
  default     = "10.241.113.0/25"
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
  type        = map(any)
  description = "Tags to be assigned to resources created by terraform"
  default = {
    definedTags  = {}
    freeformTags = {}
  }
}

# ----------------------------------------
# VCN Components Variables
# ----------------------------------------


variable "vcn_prod_hub_servicegateway_private_display_name" {
  type        = string
  description = "Prod HUB VCN Service Gateway Display Name"
  default     = "qco-ua1-prod-hub-servicegateway-private"
}

variable "vcn_prod_hub_natgateway_display_name" {
  type        = string
  description = "Prod HUB VCN NAT Gateway Display Name"
  default     = "qco-ua1-prod-hub-natgateway"
}

variable "vcn_prod_hub_natgateway_block_traffic" {
  type        = bool
  description = "Block the traffic in NAT gateway on creation"
  default     = false
}

variable "vcn_prod_hub_natgateway_public_ip_lifetime" {
  type        = string
  description = "Reserved IP Address will be created for NAT Gateway"
  default     = "RESERVED"
}
variable "vcn_prod_hub_intgw_display_name" {
  type        = string
  description = "Prod HUB VCN Internet Gateway Display Name"
  default     = "qco-ua1-prod-hub-intgw"
}

variable "vcn_prod_hub_intgw_enabled" {
  type        = bool
  description = "Is Prod HUB intgw enabled"
  default     = true
}


# ----------------------------------------
# VCN Route Table Variables
# ----------------------------------------


variable "vcn_prod_hub_routetable_untrust_display_name" {
  type        = string
  description = "Prod HUB VCN Untrust Route Table"
  default     = "qco-ua1-prod-hub-untrust-rt"
}

variable "vcn_prod_hub_routetable_private_management_display_name" {
  type        = string
  description = "Prod HUB VCN Managment Route Table"
  default     = "qco-ua1-prod-hub-management-rt"
}

variable "vcn_prod_hub_routetable_private_trust_display_name" {
  type        = string
  description = "Prod HUB VCN Trust Route Table"
  default     = "qco-ua1-prod-hub-trust-rt"
}

variable "vcn_prod_hub_routetable_private_ha_display_name" {
  type        = string
  description = "Prod HUB VCN HA Private Route Table"
  default     = "qco-ua1-prod-hub-ha-rt"
}


variable "vcn_prod_hub_routetable_vcn_hub_ingress_display_name" {
  type        = string
  description = "Prod HUB VCN Ingress Route Table"
  default     = "qco-ua1-prod-hub-vcn-ingress-rt"
}


variable "vcn_prod_hub_routetable_vcn_hub_lpg_display_name" {
  type        = string
  description = "Prod HUB VCN LPG Attachment Route Table"
  default     = "qco-ua1-prod-hub-vcn-lpg-attachment-rt"
}

# ----------------------------------------
# DRG Variables
# ----------------------------------------

variable "drg_display_name" {
  type        = string
  description = "DRG Display Name"
  default     = "qco-ua1-prod-drg"
}

variable "vcn_prod_hub_drg_attachment_display_name" {
  type        = string
  description = "Prod DRG Attachment Display Name"
  default     = "qco-ua1-prod-hub-vcn-drg-attachment"
}


variable "drg_route_distribution_distribution_type" {
  type        = string
  default     = "IMPORT"
  description = "Type of DRG Route Distribution"
}

variable "drg_route_distribution_display_name" {
  type        = string
  default     = "qco-ua1-prod-drg-import-route-distribution"
  description = "Display Name of the DRG Route Distribution"
}

variable "drg_route_distribution_statement_statements_action" {
  type        = string
  default     = "ACCEPT"
  description = "Action for the DRG Route Distribution Statement"
}

variable "drg_route_distribution_statement_statements_match_criteria_match_type" {
  type        = string
  default     = "MATCH_ALL"
  description = "SHould be one of these: DRG_ATTACHMENT_TYPE, DRG_ATTACHMENT_ID, MATCH_ALL"
}

variable "drg_route_distribution_statement_statements_match_criteria_attachment_type" {
  type        = string
  default     = "VIRTUAL_CIRCUIT"
  description = "Should be one of these: VCN, VIRTUAL_CIRCUIT, REMOTE_PEERING_CONNECTION, IPSEC_TUNNEL"
}

variable "drg_route_distribution_statement_statements_priority" {
  type        = number
  default     = 100
  description = "Priority for the DRG Route Distribution Statement"
}



variable "hub_vcn_drg_attachment_route_table_display_name" {
  type        = string
  default     = "qco-ua1-prod-hub-vcn-drg-route-table"
  description = ""
}

variable "hub_vcn_drg_attachment_route_table_is_ecmp_enabled" {
  type        = bool
  default     = false
  description = "Hub VCN DRG Route Table Display Name"
}


variable "spoke_vcn_drg_attachment_route_table_display_name" {
  type        = string
  default     = "qco-ua1-prod-spoke-vcn-drg-route-table"
  description = "Spoke VCN DRG Route Table Display Name"
}

variable "spoke_vcn_drg_attachment_route_table_is_ecmp_enabled" {
  type        = bool
  default     = false
  description = ""
}

variable "attach_import_route_distribution_to_spoke" {
  type        = bool
  default     = false
  description = "Whether to attach the import route distribution to spoke VCN route table"
}


variable "vcn_prod_hub_drg_attachment_route_table_route_rule_destination" {
  type        = string
  description = "Destination CIDR Block for the DRG Spoke Route Table Route Rule"
  default     = "0.0.0.0/0"
}

variable "vcn_prod_hub_drg_attachment_route_table_route_rule_destination_type" {
  type        = string
  description = "Destination Type for the DRG Spoke Route Table Route Rule"
  default     = "CIDR_BLOCK"
}

# ----------------------------------------
# LPG Variables
# ----------------------------------------

variable "prod_hub_vcn_to_prod_jde_vcn_lpg_display_name" {
  type        = string
  description = "Prod HUB VCN to Prod JDE VCN Local Peering Gateway Display Name"
  default     = "qco-ua1-prod-hub-vcn-to-prod-jde-vcn-lpg"
}


variable "prod_hub_vcn_to_nprd_jde_vcn_lpg_display_name" {
  type        = string
  description = "Prod HUB VCN to NPRD JDE VCN Local Peering Gateway Display Name"
  default     = "qco-ua1-prod-hub-vcn-to-nprd-jde-vcn-lpg"
}


variable "prod_hub_vcn_to_prod_nonjde_vcn_lpg_display_name" {
  type        = string
  description = "Prod HUB VCN to Prod NONJDE VCN Local Peering Gateway Display Name"
  default     = "qco-ua1-prod-hub-vcn-to-prod-nonjde-vcn-lpg"
}


variable "prod_hub_vcn_to_nprd_nonjde_vcn_lpg_display_name" {
  type        = string
  description = "Prod HUB VCN to NPRD NONJDE VCN Local Peering Gateway Display Name"
  default     = "qco-ua1-prod-hub-vcn-to-nprd-nonjde-vcn-lpg"
}

variable "prod_hub_vcn_to_prod_exadata_vcn_lpg_display_name" {
  type        = string
  description = "Prod HUB VCN to Exadata VCN Local Peering Gateway Display Name"
  default     = "qco-ua1-prod-hub-vcn-to-prod-exadata-vcn-lpg"
}



# ----------------------------------------
# Security List Variables
# ----------------------------------------

variable "vcn_prod_hub_seclist_private_trust_display_name" {
  type        = string
  description = "Prod HUB VCN trust Private Security List Display Name"
  default     = "qco-ua1-prod-hub-trust-sl"
}

variable "vcn_prod_hub_seclist_private_trust_is_stateless" {
  type        = bool
  description = "Prod HUB VCN Private Trust Security List is Stateless?"
  default     = false
}

variable "vcn_prod_hub_seclist_private_ha_display_name" {
  type        = string
  description = "Prod HUB VCN HA Subnet Private Security List Display Name"
  default     = "qco-ua1-prod-hub-ha-sl"
}

variable "vcn_prod_hub_seclist_private_ha_is_stateless" {
  type        = bool
  description = "Prod HUB VCN Private HA Security List is Stateless?"
  default     = false
}

variable "vcn_prod_hub_seclist_private_management_display_name" {
  type        = string
  description = "Prod HUB VCN management Subnet Private Security List Display Name"
  default     = "qco-ua1-prod-hub-management-sl"
}

variable "vcn_prod_hub_seclist_private_management_is_stateless" {
  type        = bool
  description = "Prod HUB VCN Private Management Security List is Stateless?"
  default     = false
}

variable "vcn_prod_hub_seclist_untrust_display_name" {
  type        = string
  description = "Prod HUB VCN Untrust Subnet Security List Display Name"
  default     = "qco-ua1-prod-hub-untrust-sl" 
}


variable "vcn_prod_hub_seclist_untrust_is_stateless" {
  type        = bool
  description = "Prod HUB VCN Untrust Security List is Stateless?"
  default     = false
}

