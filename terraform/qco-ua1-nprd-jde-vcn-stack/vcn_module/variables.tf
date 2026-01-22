# ----------------------------------------
# Common Variables
# ----------------------------------------

variable compartment_ocid {}
variable "definedTags" {
  type = map
  default = {}
}
variable "freeformTags" {
  type = map
  default = {}
} 


# ----------------------------------------
# VCN Variables
# ----------------------------------------

variable "vcn_display_name" {}

variable "vcn_dns_label" {}

variable "vcn_cidr_block" {}