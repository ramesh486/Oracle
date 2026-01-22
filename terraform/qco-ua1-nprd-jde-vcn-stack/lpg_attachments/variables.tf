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

variable "initiate_lpg_peering" {
  type    = bool
  default = false  
}
variable "lpg_peering_ocid" {}
variable "vcn_ocid" {}
variable "local_peering_gateway_display_name" {}
variable "attach_routetable_to_lpg" {
  type    = bool
  default = false
}
variable "lpg_route_table_ocid" {}