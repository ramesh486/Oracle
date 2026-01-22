# Non-Prod JDE VCN Stack (`qco-ua1-nprd-jde-vcn-stack`)

## Overview
Terraform configuration for the Non-Production JDE VCN. This stack hosts JDE-related resources for non-production environments.

## Resources Created
- **VCN**: NPRD JDE Virtual Cloud Network.
- **Subnets**: Application, Database, and other JDE tiered subnets.
- **Peering**:
  - LPG to `nprd_nonjde_vcn` (if applicable).
  - LPG to `prod_hub_vcn` (hub-and-spoke).
- **Gateways**: Service Gateway, NAT Gateway.
