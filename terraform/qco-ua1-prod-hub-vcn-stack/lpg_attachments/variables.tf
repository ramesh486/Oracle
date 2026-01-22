# ----------------------------------------
# Common Variables
# ----------------------------------------

variable "compartment_ocid" {}

variable "definedTags" {
  type = map
  default = {}
}

variable "freeformTags" {
    type = map
    default = {}
}

variable "peering_lpg_ocid" {}
variable "vcn_ocid" {}
variable "local_peering_gateway_display_name" {}
variable "attach_vcn_route_table_to_lpg" {
  description = "Attach VCN Route Table to LPG"
  default = false
  type = bool
}
variable "vcn_lpg_route_table_ocid" {
  default = ""
}