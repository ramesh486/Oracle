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

variable "drg_route_distribution_ocid" {
    type = string
    default = ""
    description = ""
}

variable "drg_route_distribution_statement_statements_action" {
    type = string
    default = ""
    description = ""
}

variable "drg_route_distribution_statement_statements_match_criteria_match_type" {
    type = string
    default = ""
    description = ""
}


variable "drg_route_distribution_statement_statements_match_criteria_attachment_type" {
  
}

variable "drg_attachment_ocid" {
    type = string
    default = ""
    description = ""
}


variable "drg_route_distribution_statement_statements_priority" {
    type = number
    default = 0
    description = ""
}