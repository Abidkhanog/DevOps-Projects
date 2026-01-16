# -----------------------------
# RDS Subnet Group (MANDATORY)
# -----------------------------
resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "vpc-b-rds-subnet-group"
  subnet_ids = [
    aws_subnet.vpc_b_subnet_1.id,
    aws_subnet.vpc_b_subnet_2.id
  ]

  tags = {
    Name = "VPC-B-RDS-Subnet-Group"
  }
}

# -----------------------------
# RDS Security Group
# -----------------------------
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow DB access from VPC-A only"
  vpc_id      = aws_vpc.vpc_b.id

  ingress {
    description = "MySQL from VPC-A"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "RDS-SG"
  }
}

# -----------------------------
# Private RDS Instance
# -----------------------------
resource "aws_db_instance" "private_rds" {
  identifier        = "vpc-b-private-db"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  allocated_storage = 20

  db_name  = "appdb"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.rds_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false
  multi_az            = false

  skip_final_snapshot = true
  deletion_protection = false

  tags = {
    Name        = "Private-RDS"
    Environment = "Lab"
  }
}

