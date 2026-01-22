# Production Hub VCN Stack (`qco-ua1-prod-hub-vcn-stack`)

## Overview
Terraform configuration for the Production Hub VCN. This acts as the central networking hub for the Production region, connecting various spokes.

## Resources Created
- **VCN**: Production Hub Virtual Cloud Network.
- **Gateways**:
  - Dynamic Routing Gateway (DRG) Attachment.
  - Multiple Local Peering Gateways (LPGs) for spokes.
  - Internet Gateway (if public).
  - NAT Gateway.
  - Service Gateway.
- **Subnets**: Management and Shared Services subnets.
