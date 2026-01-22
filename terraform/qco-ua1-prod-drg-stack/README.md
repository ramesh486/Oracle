# Production DRG Stack (`qco-ua1-prod-drg-stack`)   

## Overview
Terraform configuration for the Production Dynamic Routing Gateway (DRG). This is the core gateway for connecting the Hub VCN to On-Premise (via FastConnect/VPN) and to the DR region.

## Resources Created
- **DRG**: Production Dynamic Routing Gateway.
- **RPC**: Remote Peering Connection to DR.
- **Attachments**: VCN Attachments (managed here or in VCN stacks).
