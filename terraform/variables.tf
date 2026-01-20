### Common Variables ###


variable "region" {
    type = string
    default = "us-ashburn-1"
    description = "Region (us-ashburn-1) to deploy the DRG"    
}

variable "tenancy_ocid"{
    type = string
    default =  ""
    description = "Tenancy ID to deploy the DRG"    
}

variable "user_ocid"{
    type = string
    default =  ""
    description = "User ID to deploy the DRG"    
}

variable "fingerprint"{
    type = string
    default =  ""
    description = "fingerprint to deploy the DRG"    
}

variable "private_key"{
    type = string
    default =  ""
    description = "private key to deploy the DRG"    
}

variable "compartment_name" {
    type = string
    default = "dr_network"
    description = "Target Compartment Name to deploy the DRG"
}
variable "compartment_id_in_subtree" {
    type = bool
    default = true
    description = "Compartment ID in Subtree"
}

###  DRG Variables ### 

variable "network_drg_display_name" {
    default = "qco_dr_drg"
    type = string
    description = "Name of the DRG"
}

variable "project_tag" {
  description = "Tags to be Assigned to the Resources" 
  type = map
  default = {
    definedTags = {}
    freeformTags = {}
  }

}

