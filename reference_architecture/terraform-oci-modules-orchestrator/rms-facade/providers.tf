# Copyright (c) 2024 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    oci = {
      source = "oracle/oci"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "oci" {
  region               = var.region
}

provider "github" {
  token = var.github_token != null ? var.github_token : (var.url_dependency_source_github_token != null ? var.url_dependency_source_github_token : null)
}