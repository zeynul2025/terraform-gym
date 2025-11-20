# VPC Challenge: Production-Ready 3-Tier Architecture

**Time**: 60 minutes | **Difficulty**: Challenge | **Cost**: ~$0.05

## 🎯 Challenge Overview

Build a complete production-ready VPC with multi-AZ redundancy, proper routing, and security **from scratch**. NO skeleton code provided!

## 📋 Requirements

### 1. VPC
- CIDR: 10.0.0.0/16
- DNS hostnames and support enabled

### 2. Subnets (6 total)
Public subnets:
- 10.0.1.0/24 (us-east-1a)
- 10.0.2.0/24 (us-east-1b)

Private app subnets:
- 10.0.11.0/24 (us-east-1a)
- 10.0.12.0/24 (us-east-1b)

Private database subnets:
- 10.0.21.0/24 (us-east-1a)
- 10.0.22.0/24 (us-east-1b)

### 3. Internet Gateway
- Attach to VPC

### 4. NAT Gateway (NEW!)
- Deploy in ONE public subnet (for cost savings)
- Requires Elastic IP

### 5. Route Tables (3 total)
- Public route table → routes to IGW
- Private route table → routes to NAT Gateway
- Database route table → no internet route

### 6. Security Groups (3 tiers)
**Web tier**:
- Ingress: 80 (HTTP), 443 (HTTPS) from 0.0.0.0/0
- Egress: All traffic

**App tier**:
- Ingress: 8080 from web tier security group
- Egress: All traffic

**Database tier**:
- Ingress: 5432 (PostgreSQL) from app tier security group
- Egress: None

### 7. VPC Flow Logs (NEW!)
- Log to CloudWatch
- Capture ALL traffic (accept + reject)

### 8. Network ACL (NEW!)
- Custom NACL for database subnets
- Deny all inbound except from app subnets

## 📚 Documentation

### New Resources (research!)
- [aws_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)
- [aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)
- [aws_flow_log](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log)
- [aws_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl)

## ✅ Success Criteria

- ✅ VPC with 6 subnets across 2 AZs
- ✅ Internet Gateway attached
- ✅ NAT Gateway in public subnet
- ✅ 3 route tables properly associated
- ✅ 3 security groups with tier isolation
- ✅ VPC Flow Logs enabled
- ✅ Custom NACL for database tier
- ✅ Score 90+ on validator

## 💰 Cost Warning

NAT Gateway costs $0.045/hour!
- Deploy for < 1 hour
- Destroy immediately after validation
- Estimated cost: ~$0.03-0.05

## 💡 Architecture Diagram

```
┌─────────────────── VPC (10.0.0.0/16) ───────────────────┐
│                                                          │
│  ┌─ Public Subnets (IGW) ─┐   ┌─ Private App Subnets ─┐│
│  │ 10.0.1.0/24 (AZ-a)      │   │ 10.0.11.0/24 (AZ-a)   ││
│  │ 10.0.2.0/24 (AZ-b)      │   │ 10.0.12.0/24 (AZ-b)   ││
│  │ [NAT GW in AZ-a]        │   │ → NAT Gateway         ││
│  └─────────────────────────┘   └───────────────────────┘│
│                                                          │
│  ┌─ Private DB Subnets (No Internet) ─────────────────┐ │
│  │ 10.0.21.0/24 (AZ-a)                                │ │
│  │ 10.0.22.0/24 (AZ-b)                                │ │
│  │ [Custom NACL blocking external traffic]           │ │
│  └────────────────────────────────────────────────────┘ │
│                                                          │
└──────────────────────────────────────────────────────────┘
```

---

**This is the real test!** Can you build production infrastructure from docs alone? 🏗️
