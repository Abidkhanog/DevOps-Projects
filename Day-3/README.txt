VPC Peering with Secure Access to a Private RDS Database

🔴 Mandatory Instructions for Students
Before starting ANY task, students MUST:
Open AWS Pricing Calculator


Estimate the cost for the AWS services.


Understand which resources are billable

Objective
In this task, you will:
Create two VPCs


Establish VPC Peering


Deploy a Private RDS database in one VPC


Access the private RDS from an EC2 instance in another VPC


Understand routing, security groups, and private connectivity


This task focuses on east-west networking inside AWS without using public internet.

AWS Services Used
Amazon VPC


VPC Peering


Route Tables


EC2


Amazon RDS (Free Tier)


Security Groups



Cost Considerations
Use t3.micro EC2


Use RDS Free Tier eligible instance


Same region VPC peering (no data transfer cost)


No NAT Gateway, no VPN, no Load Balancer



Architecture Overview
VPC-A (10.0.0.0/16)           VPC-B (10.1.0.0/16)
------------------           ------------------
EC2 (Private)   <==========>  RDS (Private)
        |            VPC Peering
        |
   Route Tables + SG rules


Step-by-Step Guide

Step 1: Create Two VPCs
Create VPC-A
AWS Console → VPC → Create VPC


Name: VPC-A


IPv4 CIDR: 10.0.0.0/16


Create


Create VPC-B
Create another VPC


Name: VPC-B


IPv4 CIDR: 10.1.0.0/16


Create



Step 2: Create Subnets in Both VPCs
VPC-A Subnet
Name: VPC-A-Private-Subnet


CIDR: 10.0.1.0/24


AZ: same AZ as VPC-B subnet (recommended)


VPC-B Subnet
Name: VPC-B-Private-Subnet


CIDR: 10.1.1.0/24


Note: Both subnets remain private (no internet route).

Step 3: Create VPC Peering Connection
VPC Console → Peering Connections


Click Create peering connection


Peering name: VPC-A-to-VPC-B


Requester:


VPC: VPC-A


Accepter:


VPC: VPC-B


Region: same region


Create peering


Select peering connection → Actions → Accept request


Peering status should be Active

Step 4: Update Route Tables for Peering
Update VPC-A Route Table
VPC → Route Tables


Select route table associated with VPC-A-Private-Subnet


Edit routes → Add:


Destination: 10.1.0.0/16


Target: VPC Peering Connection


Save


Update VPC-B Route Table
Select route table for VPC-B-Private-Subnet


Add:


Destination: 10.0.0.0/16


Target: VPC Peering Connection


Save



Step 5: Launch EC2 in VPC-A (Client Instance)
EC2 → Launch instance


Name: App-Server


Instance type: t3.micro


Network:


VPC: VPC-A


Subnet: VPC-A-Private-Subnet


Security Group: EC2-SG


Inbound:


SSH (22) → Your IP (or Bastion/VPN if used later)


Launch



Step 6: Create Private RDS in VPC-B
AWS Console → RDS → Create database


Engine: MySQL or PostgreSQL


Template: Free Tier


DB Identifier: vpc-b-private-db


Connectivity:


VPC: VPC-B


Subnet group: use VPC-B-Private-Subnet


Public access: No


Security Group: RDS-SG


Inbound rule:


DB Port (3306 / 5432)


Source: 10.0.0.0/16 (VPC-A CIDR)


Create database



Step 7: Test Private Connectivity
SSH into App-Server (via bastion/VPN if needed)


Install DB client:


MySQL:

 sudo yum install mysql -y


PostgreSQL:

 sudo yum install postgresql15 -y


Connect to RDS:

 mysql -h <rds-endpoint> -u <user> -p
 OR

 psql -h <rds-endpoint> -U <user> -d <db>


Successful connection confirms:
VPC Peering works


Routing is correct


Security Groups are properly configured



Python Mini-Exercise (After Task 2)
Exercise 1: Verify VPC Peering via boto3
Students write a Python script to:
List all VPC peering connections


Print:


Peering ID


Status


Requester & Accepter CIDRs


Exercise 2: RDS Connectivity Test
Write a Python script that:
Connects to the private RDS endpoint


Runs:

 CREATE TABLE test (id INT);
INSERT INTO test VALUES (1);
SELECT * FROM test;



What you Learn
VPC-to-VPC private communication


Route table design for peering


Secure database access without public exposure


Difference between north-south vs east-west traffic


Real-world microservice networking pattern



