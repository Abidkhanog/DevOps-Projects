resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_a.id
  tags   = { Name = "VPC-A-IGW" }
}

resource "aws_route_table" "vpc_a_rt" {
  vpc_id = aws_vpc.vpc_a.id
}

resource "aws_route" "vpc_a_internet" {
  route_table_id         = aws_route_table.vpc_a_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "vpc_a_to_b" {
  route_table_id            = aws_route_table.vpc_a_rt.id
  destination_cidr_block    = "10.1.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route_table_association" "vpc_a_assoc" {
  subnet_id      = aws_subnet.vpc_a_subnet.id
  route_table_id = aws_route_table.vpc_a_rt.id
}

resource "aws_route_table" "vpc_b_rt" {
  vpc_id = aws_vpc.vpc_b.id
}

resource "aws_route" "vpc_b_to_a" {
  route_table_id            = aws_route_table.vpc_b_rt.id
  destination_cidr_block    = "10.0.0.0/16"
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

resource "aws_route_table_association" "vpc_b_assoc_1" {
  subnet_id      = aws_subnet.vpc_b_subnet_1.id
  route_table_id = aws_route_table.vpc_b_rt.id
}

resource "aws_route_table_association" "vpc_b_assoc_2" {
  subnet_id      = aws_subnet.vpc_b_subnet_2.id
  route_table_id = aws_route_table.vpc_b_rt.id
}

