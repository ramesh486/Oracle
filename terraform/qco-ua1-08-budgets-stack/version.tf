terraform {
  cloud {
    organization = "quantaservices"
    workspaces {
      name = "qco-oci-platform-landingzone-iam-compartments"
    }
  }
}