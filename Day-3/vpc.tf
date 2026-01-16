# --------------------
# VPC-A
# --------------------
resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"
  tags       = { Name = "VPC-A" }
}

resource "aws_subnet" "vpc_a_subnet" {
  vpc_id                  = aws_vpc.vpc_a.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true # TEMP for lab

  tags = { Name = "VPC-A-Subnet" }
}

# --------------------
# VPC-B
# --------------------
resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"
  tags       = { Name = "VPC-B" }
}

resource "aws_subnet" "vpc_b_subnet_1" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = "ap-south-1a"
  tags              = { Name = "VPC-B-Subnet-1" }
}

resource "aws_subnet" "vpc_b_subnet_2" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = "ap-south-1b"
  tags              = { Name = "VPC-B-Subnet-2" }
}

