# VPC Exercise Series

Complete guide to mastering AWS VPC (Virtual Private Cloud) networking with Terraform.

## 📚 Series Overview

This series teaches you how to build AWS network infrastructure from scratch, from basic VPCs to complete production-ready network architectures.

**Total Time**: ~75 minutes (exercises) + 60 minutes (challenge)
**Difficulty Progression**: Beginner → Intermediate → Challenge
**Cost**: $0.00 - $0.05 (minimal data transfer, NAT Gateway time if applicable)

## 🎯 Learning Path

### Exercise 01: Basic VPC and Subnets ⭐
**Time**: 25 minutes | **Difficulty**: Beginner

Create a VPC with public and private subnets across multiple availability zones.

**You'll learn**:
- Creating VPCs with CIDR blocks
- Subnet creation and AZ placement
- Public vs private subnets
- Subnet CIDR allocation

**Path**: `exercise-01-basic-vpc/`

---

### Exercise 02: Internet Gateway and Routing ⭐⭐
**Time**: 25 minutes | **Difficulty**: Intermediate

Add internet connectivity with an Internet Gateway and configure route tables.

**You'll learn**:
- Creating Internet Gateways
- Route table configuration
- Subnet route table associations
- Default routes (0.0.0.0/0)

**Path**: `exercise-02-internet-gateway/`

---

### Exercise 03: Security Groups ⭐⭐
**Time**: 25 minutes | **Difficulty**: Intermediate

Create security groups with ingress and egress rules for common application tiers.

**You'll learn**:
- Security group creation
- Ingress and egress rules
- Security group references
- Common port configurations (HTTP, HTTPS, SSH)

**Path**: `exercise-03-security-groups/`

---

### Challenge: Complete VPC Architecture ⭐⭐⭐
**Time**: 60 minutes | **Difficulty**: Challenge

**🚨 NO SKELETON CODE PROVIDED!**

Build a production-ready 3-tier VPC architecture from documentation alone.

**Requirements**:
- Multi-AZ VPC with public and private subnets
- Internet Gateway and NAT Gateway
- Route tables for public and private traffic
- Security groups for web, app, and database tiers
- PLUS: VPC Flow Logs (new!)
- PLUS: Network ACLs (new!)

**Path**: `challenge-complete-vpc/`

---

## 🗺️ Quick Navigation

| Exercise | Time | Difficulty | Status |
|----------|------|------------|--------|
| [01: Basic VPC](exercise-01-basic-vpc/) | 25 min | ⭐ Beginner | ✅ Ready |
| [02: Internet Gateway](exercise-02-internet-gateway/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [03: Security Groups](exercise-03-security-groups/) | 25 min | ⭐⭐ Intermediate | ✅ Ready |
| [Challenge: Complete VPC](challenge-complete-vpc/) | 60 min | ⭐⭐⭐ Challenge | ✅ Ready |

## 📖 What You'll Master

### Core VPC Skills
- ✅ Create VPCs with proper CIDR blocks
- ✅ Design multi-AZ subnet architectures
- ✅ Configure internet connectivity
- ✅ Set up route tables and associations
- ✅ Create and manage security groups
- ✅ Implement network ACLs
- ✅ Enable VPC flow logs

### Terraform Skills
- ✅ Work with CIDR block calculations
- ✅ Use count and for_each for subnets
- ✅ Reference resources across network components
- ✅ Manage complex dependencies

### Networking Best Practices
- ✅ Multi-AZ redundancy
- ✅ Public vs private subnet design
- ✅ Security group vs NACL usage
- ✅ Least privilege network access
- ✅ Network monitoring and logging

## 💰 Cost Information

**Mostly FREE**:
- VPC: $0.00
- Subnets: $0.00
- Internet Gateway: $0.00
- Route Tables: $0.00
- Security Groups: $0.00
- Network ACLs: $0.00
- VPC Flow Logs: $0.00 (storage costs if logs generated)

**Minimal cost**:
- NAT Gateway: $0.045/hour (~$0.02 for 30-min exercise)
- Data transfer: < $0.01

**Total series cost**: < $0.05

## 🎓 VPC Fundamentals

**CIDR Blocks**:
- VPC: /16 (65,536 IPs) - e.g., 10.0.0.0/16
- Subnet: /24 (256 IPs) - e.g., 10.0.1.0/24

**Availability Zones**:
- Deploy subnets across multiple AZs for high availability
- Each AZ is a physically separate location

**Public vs Private Subnets**:
- Public: Has route to Internet Gateway (0.0.0.0/0 → IGW)
- Private: No direct internet route (uses NAT for outbound)

## 🔗 Related Course Material

This series complements:
- **Course**: Networking and security
- **Production**: Multi-tier application architecture
- **Best Practices**: Network isolation

## 🚀 After This Series

### Next Topics
- **EC2 Series**: Launch instances in your VPC
- **RDS Series**: Database networking
- **ELB Series**: Load balancers and target groups

### Advanced VPC Topics (Not in Gym)
- VPC Peering
- Transit Gateway
- PrivateLink / VPC Endpoints
- Direct Connect
- Site-to-Site VPN

---

**Ready to start?** Begin with [Exercise 01: Basic VPC](exercise-01-basic-vpc/)!
