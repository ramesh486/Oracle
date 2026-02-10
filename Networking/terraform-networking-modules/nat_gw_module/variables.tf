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
# NAT Gateway Variables
# ----------------------------------------

variable "vcn_ocid" {}
variable "natgw_display_name" {}
variable "natgw_block_traffic" {}
variable "public_ip_lifetime" {
  default = "RESERVED"
}