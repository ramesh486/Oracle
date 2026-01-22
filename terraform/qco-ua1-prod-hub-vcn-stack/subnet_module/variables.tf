# ----------------------------------------
# Common Variables
# ----------------------------------------

variable compartment_ocid {}
variable "definedTags" {
  type = map
}
variable "freeformTags" {
  type = map
}

# ----------------------------------------
# Subnet Variables
# ----------------------------------------
variable "vcn_ocid" {}

variable "vcn_subnet_display_name" {}

variable "vcn_subnet_dns_label" {}

variable "vcn_subnet_cidr_block" {}

variable "vcn_subnet_prohibit_internet_ingress" {}

variable "vcn_subnet_prohibit_public_ip_on_vnic" {}

variable "route_table_ocid" {}

variable "dhcp_options_ocid" {}

variable "security_list_ocid" {}
