# DR Hub VCN Stack (`qco-ua1-dr-hub-vcn-stack`)

## Overview
Terraform configuration for the Disaster Recovery (DR) Hub VCN in OCI. This stack manages the central networking hub for the DR region.

## Resources Created
- **VCN**: DR Hub Virtual Cloud Network.
- **Subnets**: Public and Private subnets for hub services.
- **Gateways**: DRG Attachment, LPGs.
- **Routing**: Route Tables and Rules.
- **Security**: Security Lists and Rules.
