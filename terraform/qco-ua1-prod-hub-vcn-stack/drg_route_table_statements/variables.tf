###  DRG Variables ### 

variable compartment_ocid {
    type = string
    default = ""
    description = ""
}

variable "definedTags" {
    type = map
    default = {}
    description = ""
}

variable "freeformTags" {
    type = map
    default = {}
    description = ""
}

variable "drg_route_table_ocid" {
    type = string
    default = ""
    description = ""
}

variable "drg_route_table_route_rule_destination" {
    type = string
    default = ""
    description = ""
}

variable "drg_route_table_route_rule_destination_type" {
    type = string
    default = false
    description = ""
}

variable "drg_attachment_ocid" {
    type = string
    default = ""
    description = ""
}
