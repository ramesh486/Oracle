provider "oci" {
  region           = var.region
  user_ocid		   = var.user_ocid
  tenancy_ocid     = var.tenancy_ocid
  fingerprint      = var.fingerprint
  private_key	   = var.private_key
  ignore_defined_tags = ["Oracle-Tags.CreatedBy", "Oracle-Tags.CreatedOn"]
}