## --------- Common Variables --------

variable "tenancy_ocid" {
type           = string
description    = "Target Tenancy OCID"
default        = ""
}

variable "region" {
type            = string
description     = "Region"
default         = "us-ashburn-1"
}

variable "user_ocid" {
  type        = string
  default     = ""
  description = "User ID to deploy the Budgets"
}
variable "fingerprint" {
  type        = string
  default     = ""
  description = "fingerprint to deploy the Budgets"
}
variable "api_private_key" {
  type        = string
  default     = ""
  description = "private key to deploy the Budgets"
}

variable "compartment_id_in_subtree" {
    type        = bool
    default     = false
    description = "Compartment ID in Subtree"
}

variable "compartment_name" {
    type         = string
    default      = "qco-prod-storage"
    description  = "Compartment Name to deploy DB System"
}

variable "network_compartment_id_in_subtree" {
    type         = bool
    default      = false
    description  = "Compartment ID in Subtree"
}

variable "network_compartment_name" {
    type         = string
    default      = "qco-prod-network"
    description  = "Compartment Name of subnets"
}

variable "project_tag" {
	type = map
	default = {
		definedTags = {}
		freeformTags = {}
	}
}


variable "sn_db_nprd_display_name" {
  type = string
  default = "qco-ua1-nprd-dbcs-client-sn"
  description = "The name of the subnet where the DB System is located"
}

variable "sn_sec_db_nprd_display_name" {
  type = string
  default = "qco-ua1-nprd-dbcs-client-sn"
  description = "The name of the subnet where the DB System is located"
}

## --------- DataGuard Variables --------

variable "secondary_dbs_availability_domain" {
  type        = string
  default     = "pMlX:US-ASHBURN-AD-2"
  description = "The name of the availability domain that the DB system will be located"
}

variable "is_dataguard_enabled" {
  type        = bool
  default     = false
  description = "Is Data Guard enabled"
}

variable "secondary_dbs_display_name" {
  type        = string
  default     = "qco-db-nprd-dataguard2"
  description = "Secondary DB System Display Name"
}

variable "secondary_dbs_hostname" {
  type        = string
  default     = "qcodbnprddataguard2"
  description = "Secondary DB System Host Name"
}

## --------- Database Variables --------

variable "ssh_public_key" {
  type        = string
  default     = ""
  description = "SSH Public key"
}

variable "dbs_db_name" {
  type        = string
  default     = "qcobase123"
  description = "Database System Name"
}


variable "primary_dbs_hostname" {
  type         = string
  default      = "qcodbnprddataguard"
  description  = "Primary DB System Host Name"
}

variable "primary_dbs_display_name" {
  type        = string
  default     = "qco-db-nprd-dataguard1"
  description = "Primary DB System Display Name"
}

variable "primary_dbs_availability_domain" {
  type        = string
  default     = "pMlX:US-ASHBURN-AD-1"
  description = "The name of the availability domain that the DB system will be located"
}

variable "dbs_node_count" {
  type        = string
  default     = "1"
  description = "The number of nodes to launch DB system"
}

variable "db_version" {
  type        = string
  default     = "19.20.0.0"
  description = "Database Version"
}

variable "admin_password" {
  type        = string
  default     = ""
  description = "A strong password for the DB System. The password must contain no fewer than nine characters and include:" #Atleast two uppercase, two lowercase, two numeric, two special characters that include  # "_" #  and " " only"
}

variable "db_workload" {
  type        = string
  default     = "OLTP"
  description = "The database workload type"
}

variable "database_edition" {
  type        = string
  default     = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
  description = "The Oracle Database Edition that applies to all the databases on the DB system"
}

variable "data_storage_size_in_gb" {
  type        = string
  default     = "16"
  description = "The size of the DB system"
}

variable "database_instance_shape" {
  type        = string
  default     = "VM.Standard2.1"
  description = "The shape of the DB system"
}

variable "license_model" {
  type        = string
  default     = "LICENSE_INCLUDED"
  description = "License model (LICENSE_INCLUDED || BRING_YOUR_OWN_LICENSE)"
}

variable "time_zone" {
  type        = string
  default     = "UTC"
  description = "The time zone to use for the DB system"
}

variable "auto_backup_enabled" {
  type        = string
  default     = false
  description = "If set to true, configures automatic backups"
}
